#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pony'
require 'sinatra/activerecord'
require 'braintree'
require './config/environments'

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "pynw5bn48gsv6rgb"
Braintree::Configuration.public_key = "mmsz7cbkh7g9nsn2"
Braintree::Configuration.private_key = "584a1eea9194ea48a9811e5b05c22dbc"

#set :database, "sqlite3:pizzashop.db"
#set :database, {adapter: "postgresql", database: "pizzashop.db"}

class Product <ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :name, presence: true
    validates :phone, presence: true
    validates :address, presence: true
end

def order_split orders
	s1 = orders.split(/,/)
	arr=[]
	s1.each do |x|
		s2 = x.split(/\=/)
		s3=s2[0].split(/_/)
		arr2=[s3[1], s2[1]]
		arr.push arr2
	end
	return arr	
end

get '/' do
	@products=Product.where(category: 'pizza')
	erb :index			
end

get '/about' do
	erb :about			
end

get '/contacts' do
	erb :contacts			
end

post '/contacts' do
	@name= params[:name]
	@email = params[:email]
	@text = params[:text]
	hh={:name=> "Please, enter your name", :email=>"Please, enter your phone Email", :text=>"Enter your text-message"}
	@error=hh.select {|key,_| params[key]==""}.values.join("; ")
	if @error==''
    	Pony.mail(
      		:to => "admiral-f@yandex.ru",
      		:from => "admiral-f@yandex.ru",
      		:subject => params[:name] + " has contacted you",
      		:body => params[:email] + " write message: " + params[:text],
      		:via => :smtp,
      		:via_options => { 
        	:address              => 'smtp.yandex.ru', 
        	:port                 => '25', 
        	:enable_starttls_auto => true, 
        	:user_name            => 'admiral-f', 
        	:password             => 'kalinin1987', 
        	:authentication       => :plain
    		})
    		@answer = 'Your message send'
  	end  
  erb :contacts
			
end

get '/shop' do
	@category=Product.select(:category).distinct
	@products=Product.all
	erb :shop			
end

get '/shop/:category' do
	@category=Product.select(:category).distinct
	@products=Product.where(category: params[:category])
	erb :shop			
end

post '/cart' do
	@orders_input=params[:orders]
	@items = order_split @orders_input
	if @items.length ==0
		return erb "Your cart is empty"
	end
	@items.each do |item|
		item[0] = Product.find(item[0])
	end
	
	erb :cart
end

post '/order' do
	@ordering = Order.new params[:order]
	if @ordering.save
		@answer="Order has been placed success, please fill in the form"

	else
		@error=@ordering.errors.full_messages.first
	end
  Braintree::ClientToken.generate
	erb :order
end

get '/admin' do
	erb :admin
end

post '/admin' do
	login = params[:login]
	password = params[:password]
	if login=='admin' && password=='12345'
		@orders=Order.all.order('created_at DESC')
		erb :admin_orders
	else
		@error='Wrong login or password'
		erb :admin
	end
end	


post '/payment' do
  @order_price=Order.last
  result = Braintree::Transaction.sale(
  :amount => "#{@order_price.price}",
  :payment_method_nonce => 'fake-valid-nonce',
  :options => {
    :submit_for_settlement => true
  }
  )
  if result.success?
    @answer="Success! Transaction ID: #{result.transaction.id}"
  else
    @error="Error: #{result.message}"
    redirect '/cart'
    end
  erb :payment
end


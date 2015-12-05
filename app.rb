#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pony'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product <ActiveRecord::Base
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
	orders_input=params[:orders]
	@orders = order_split orders_input
	erb "ffsffds #{@orders.inspect}"
end

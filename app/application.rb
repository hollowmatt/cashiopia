require 'sinatra/base'
require_relative './models/cash'

class Bank < Sinatra::Base

  def initialize
    super
  end

  #home page: show methods and params
  get '/' do
    "Hello"
  end

  #put something into the cache
  post '/cashin' do
    cash = Cash.new(:session_id => params[:session_id], :session_value => params[:session_value])
    if cash.save
      redirect '/'
    else
      "Error saving doc"
    end
  end

  #get something from the cache
  get '/cashout' do
    cash = Cash.where("session_id" => params[:session_key])
    puts cash.next.inspect
  end

  #delete something from the cache
  delete '/losecash/:session_key' do
    cash = Cash.where(:session_id => params[:session_key])
    if cash.delete
      "200"
    else
      "404"
    end
  end

end

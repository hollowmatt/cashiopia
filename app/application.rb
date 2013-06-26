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
    puts cash
    if cash.save
      redirect '/'
    else
      "Error saving doc"
    end
  end

  #get something from the cache
  get '/cashout' do
    cash = Cash.find_by_session_id(params[:session_key])
    puts cash
    "#{cash.session_value}"
  end

  #delete something from the cache
  delete '/losecash' do
    cash = Cash.find_by_session_id(params[:session_key])
    if cash.delete
      "200"
    else
      "404"
    end
  end

end

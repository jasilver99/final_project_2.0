require 'bundler'
require 'twilio-ruby'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base

  get'/' do
    erb :index
  end
  
 
  post '/results' do
    @choice = params[:compliment]
    @number = params[:number]
    @name = params[:name]
    @name2 = params[:name2]
    @callback_number = params[:callback_number]
    @include_link = params[:include_link]
# @message = compliment(@choice)
    @message1 = Message.new(@choice)
    @message =  @message1.pick_comp
    @message1.send_message(@message, @name, @number, @name2, @callback_number, @include_link)
#     send_message(@message, @name, @number, @name2, @callback_number, @include_link)
    erb :results
  end
end
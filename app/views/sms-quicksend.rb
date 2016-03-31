require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/sms-quicksend' do
  sender = params[:From]
  friends = {
    "+18582618198" => "Yongkyun Daniel Lee",
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end
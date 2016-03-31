require 'rubygems'
require 'twilio-ruby'

class TestController < ApplicationController
	# include Webhookable

	# after_filter :set_header

	# skip_before_action :verify_authenticity_tokens

	def send(message)
		account_sid = 'ACda0dbb3e4a69dd921381cba51ca4ffa8'
		auth_token = '6a3db74940bf5aca4e1918385d32e19e'
		client = Twilio::REST::Client.new account_sid, auth_token

		from = "+13345813776"

		friends = {
			"+18582618198" => "Daniel"			
		}
		friends.each do |key, value|
			client.account.messages.create(
				:from => from,
				:to => key,
				:body => message
			)
			puts "Sent message to #{value}"
		end
	end
end
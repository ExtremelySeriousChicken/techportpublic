#!/usr/bin/ruby

require 'rubygems'
require 'twilio-ruby'

class TestsController < ApplicationController

	#after_filter :set_header

	skip_before_action :verify_authenticity_token

	def receive
		state = true # variable to check error in order message
		err_msg = "Wrong input - please keep the following format:\nItem, Mins, Msg"
		acc_msg = "Your order has been listed to the system"

		sender = params[:From]
		message_raw = params[:Body] # raw message received
		message_arr = message_raw.strip.split(",") # raw message split into words
		
		puts message_arr.length

		# check if the received message is in format
		if message_arr.length == 3
			item = message_arr[0]
			mins = message_arr[1]
			description = message_arr[2]
			if is_int(mins) # check if the quantity is right
				state = true
			else
				state = false
			end
		else
			state = false
		end

		twiml = Twilio::TwiML::Response.new do |r|
		#	r.Message = "Your order has been accepted."
		end

		# format error - usage message
		if state
			Order.create(
				phone_number: sender,
				message: message_raw,
				item: item,
				time_left: mins,
				description: description,
				status: 0
				)
			send_message(acc_msg, sender)
		else
			send_message(err_msg, sender)
		end
		#send_message("Your order has been accepted.")

		# puts "print twiml"
		# puts twiml.text
		puts sender
		puts item
		puts mins
		puts description
		puts message_raw

		return render xml: twiml.text
	end

	# param content the content of the message
	# param receiver
	def send_message(content, receiver)
		account_sid = ENV['acc_id']
		auth_token = ENV['auth_token']
		client = Twilio::REST::Client.new account_sid, auth_token

		from = ENV['from_time']


		# friends.each do |key, value|
		client.account.messages.create(
			:from => from,
			:to => receiver,
			:body => content
		)
		puts "Sent message to #{receiver}"
		#end
	end

	def is_int(str)
		true if Integer(str) rescue false
	end
end

require 'pry'

class Transfer

	attr_accessor :amount, :sender, :receiver, :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		
		if sender.valid? && receiver.valid?
			true
		else 
			false
		end
		
	end

	def execute_transaction
		@current_amount = @amount
		if sender.balance >= @amount
			sender.balance -= @amount
		else
			@status = "rejected"
			return "Transaction rejected. Please check your account balance."
		end
		receiver.balance += @amount
		@status = "complete"
		@amount = 0
	end

	def reverse_transfer
		if @status == "complete"
			receiver.balance -= @current_amount
			sender.balance += @current_amount
			@status = "reversed"
		end	
	end





end

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
   #binding.pry
    if sender.balance > amount
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      binding.pry
      @status = "complete"
    elsif
      sender.balance < amount || sender.close_account?
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    else
    end
  end

  def reverse_transfer


  end

end

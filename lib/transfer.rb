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
    if valid? && sender.balance >= amount && self.status == "pending"
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      self.status = "complete"
      #binding.pry
    else
      "Transaction rejected. Please check your account balance."
      s
    end
  end

  def reverse_transfer
    #binding.pry
    if @status == "complete"
      #binding.pry
    receiver.balance = receiver.balance - amount
    sender.balance = sender.balance + amount
    @status = "reversed"
    else
  end

  end

end

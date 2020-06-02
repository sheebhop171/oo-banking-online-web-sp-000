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
    if sender.balance > amount && status = "complete"
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      #binding.pry
      @status = "complete"
    elsif
      sender.balance < amount || sender.status == "closed"
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    else
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

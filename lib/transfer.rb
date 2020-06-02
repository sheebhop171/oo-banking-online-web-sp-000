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
      #binding.pry
      @status = "complete"
    else
      sender.balance < amount || sender.account == "closed"
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
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

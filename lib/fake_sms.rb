module FakeSms
  attr_reader :messages

  Message = Struct.new(:num, :msg)
  @messages = []

  def self.send_sms(num, msg)
    @messages << Message.new(num, msg)
  end
end

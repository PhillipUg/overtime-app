module SmsTool
  def self.send_sms(num, msg)
    puts 'Sending SMS...'
    puts "#{msg} to #{num}"
  end
end
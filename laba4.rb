require 'ipaddr'

def is_ip?(ip)
  !!IPAddr.new(ip) rescue false
end

puts "Введіть IP-адресу:"
ip = gets.chomp

if is_ip?(ip)
  puts "Це дійсна IP-адреса."
else
  puts "Це недійсна IP-адреса."
end


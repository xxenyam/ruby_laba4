require 'ipaddr'
require 'test/unit'

def is_ip?(ip)
  !!IPAddr.new(ip) rescue false
end

if __FILE__ == $0
  puts "Введіть IP-адресу:"
  ip = gets.chomp

  if is_ip?(ip)
    puts "Це дійсна IP-адреса."
  else
    puts "Це недійсна IP-адреса."
  end
end

class TestIPv4 < Test::Unit::TestCase
  def test_valid_ipadd
    assert(is_ip?("192.77.52.7"))
    assert(is_ip?("0.0.0.0"))
    assert(is_ip?("255.255.255.255"))
  end

  def test_invalid_ipadd
    assert(!is_ip?("256.256.256.256"))
    assert(!is_ip?("192.77.02.7"))  
    assert(!is_ip?("0.0.0.0."))
    assert(!is_ip?("ksu.sgd.lu.dsw"))
    assert(!is_ip?("192-77.52.7"))
    assert(!is_ip?("192. 77.52.7"))
    assert(!is_ip?("192..168.1.1"))
    assert(!is_ip?("192.77.52"))
    assert(!is_ip?("192.77.52.4.7"))
    assert(!is_ip?("..."))
    assert(!is_ip?(""))
  end
end

require_relative 'scoring'

def run
  input_pins = gets.strip
  puts score(input_pins.split(',').map(&:to_i))
end

puts 'Please give pins (separated by comma) for each ball starting with the 1st frame...'

run

#!/bin/ruby
###
# Converts an intiger to roman numerals using a hash 

def roman_numeral_convert(number)
  roman_numerals = Hash.new
  roman_numerals = { 1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M" }
  
  roman_numerals = roman_numerals.sort.reverse

  final = String.new

  roman_numerals.each do |key, value|
    if (number/key) > 0
      final += value * (number/key)
      number = number%key
    end
  end
  final
end

number = gets.chomp.to_i

puts roman_numeral_convert(number)

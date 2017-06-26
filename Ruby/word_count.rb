#!/bin/ruby
# Given the words in the magazine and the words in the ransom note, 
# print 'Yes' if he can replicate his ransom note exactly using whole words from the magazine; otherwise, print 'No'.

m,n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
magazine = gets.strip
ransom = gets.strip

magazine = magazine.split(' ')
ransom = ransom.split(' ')

## Created a hash of all the words and negative the values of
## the words if its required in the ransom and positive if its in the magazine.
## This means if there are any negative numbers in the hash once completly running through
## each array, then it is a fail because there are to many words in ransom than magazine.

counts = Hash.new 0

ransom.each do |word|
  counts[word] -= 1
end

magazine.each do |word|
  counts[word] += 1
end

def check_hash_for_neg(hash)
  hash.each do |key, value|
    if value.to_i < 0
      puts "No"
      return
    end
  end
  puts "Yes"
end


check_hash_for_neg(counts)

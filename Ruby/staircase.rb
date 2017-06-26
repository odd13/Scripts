#!/bin/ruby
# Write a program that prints a staircase of size 'n'.
n = gets.strip.to_i

line_length = n
step = "#"

# Loop through the number of times inputed and 
# show staircase if that many steps and that high
n.times do |n|
    puts (step*(n+1)).rjust(line_length)
end

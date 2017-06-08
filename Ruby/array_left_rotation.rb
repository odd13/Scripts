#!/bin/ruby
=begin
A left rotation operation on an array of size n shifts each of the array's elements 1 unit to the left. For example, if 2 left rotations are performed on array [1,2,3,4,5], then the array would become [3, 4, 5, 1, 2].

Given an array of n integers and a number, d, perform  left rotations on the array. Then print the updated array as a single line of space-separated integers.

Input Format

The first line contains two space-separated integers denoting the respective values of  (the number of integers) and  (the number of left rotations you must perform). 
The second line contains  space-separated integers describing the respective elements of the array's initial state.

Output Format

Print a single line of n space-separated integers denoting the final state of the array after performing d left rotations.

Sample Input

5 4
1 2 3 4 5
Sample Output

5 1 2 3 4

=end

n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

# Created a Temp array so the original can be referenced later if need be.
tmp_a = Array.new
tmp_a = a.clone

# Store the first item in the array and remove  
# Then push that to the end of the temp array
k.times do
    array_add = tmp_a.shift
  tmp_a.push(array_add)
end

# Output the temp array as per requirements
puts tmp_a.join(" ")

## file: flatten_array.rb
# This file was created for a test. Request was to take
# a multidimensional array and flatten to a single
# dimensional array.
   a = [[1,2,3,55],4,5,[5,4,3,2,1],18]
   new_array = Array.new

   a.each do |i|
    # This checkes to see if the item in the array is
    # itself an array
    if i.is_a? Array
      n = 0
      # For each number in the array, output on the
      # screen and place in a new array
      while n < i.length do
        puts i[n]                 
        new_array.push(i[n])
        n += 1
      end
    else
    # If the item is not an array then the item is
    # already flat, so place in the new array
      new_array.push(i)
   end
end
# Display the array on the screen.
puts new_array.inspect

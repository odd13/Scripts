# file: prime_number_test.rb
# An application to test if a number is a prime number

## primetest
# Pass number to test (numtest), Counter is the division number, is_prime is a flag to
# notify the user if it is a prime or not. Once the counter has exceded the num_to_check
# the application returns is_prime (should still be 1 from initilization). Durring the 
# calculation, at any point there is a remainder of zero then the is_prime is set to 0
# test on the number is completed and returned to the user.
def primetest(num_to_check, counter, is_prime)
  while counter<=(num_to_check/2) do
    if(num_to_check%counter==0)
      is_prime = 0
      break
    end
    counter += 1
  end
  
  # Outputs the findings of the calculation
  if(is_prime == 1)
    puts "#{num_to_check} IS a prime Number!!!"
  else
    puts "#{num_to_check} is NOT a prime number"
  end
end

# request the user to enter a number for testing
puts "What number would you like me to check? "
# convert the input directly to a fixednum
num_to_check = gets.to_i

# Starting the division at 2, as 1 will always divide into a number.
counter = 2
# is_prime flag is set to be a prime number by default. If found not, then flag is set to zero.
is_prime = 1

if (num_to_check > 0)
  primetest(num_to_check, counter, is_prime)
else
  puts "Please enter an integer or number greater then 0."
end

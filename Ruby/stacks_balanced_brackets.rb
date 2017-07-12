#!/bin/ruby
t = gets.strip.to_i
expression_array = []


for a0 in (0..t-1)
    expression = gets.strip
    expression_array.push(expression)
end

def bracket_ballance(s)
  a = s.split("")
  t = []

  a.each do |a|
    #puts "inspect: #{a}"
    if a == "{" || a == "[" || a == "("
      t.push(a)
    elsif a == "}" || a == "]" || a == ")"
      #puts " to rremove: #{t.last}"
      if t.last == "{" && a == "}"
        t.pop
      elsif t.last == "(" && a == ")"
        t.pop
      elsif t.last == "[" && a == "]"
        t.pop
      else
        #puts t
        return "NO"
      end
    end
  end
    #puts t
    
  if t.empty?
    return "YES"
  else
    return "NO"
  end
end


expression_array.each do |e|
   puts bracket_ballance(e)
end

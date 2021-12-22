#! user/bin/ruby

class Solution

   def all_combination(n)
      arr =[ ]
      for i in 1 .. n
         arr.append(i)  
      end
      for i in 1 .. n
         puts "#{arr.combination(i).to_a}"
      end 
   end

   def Way(n)
       if (n==0)
           return 1
       elsif (n<0)
           return 0
       else
            return Way(n-3)+Way(n -2) + Way(n-1)
       end 
   end
end
instance=Solution.new
n=gets.chomp.to_i
puts (instance.Way(n))
instance.all_combination(n)









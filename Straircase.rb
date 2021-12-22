# Straircase Code

#! user/bin/ruby

class Solution

  

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

class MyArray 
	
    def combinations(n, result, index, sum) 
     if (index > n || sum > n) 
		return
     end
     if (sum == n) 
		i = 0
	while (i < index) 
	       print(" ", result[i] ," ")
		i += 1
	end
		print("\n")
	else 
		i = n
	while (i >= 1) 
				
	        result[index] = i
		self.combinations(n, result, index + 1, sum + i)
		i -= 1
	end
      end
    end
end
obj = MyArray.new()
instance=Solution.new
n=gets.chomp.to_i

result = Array.new(n, 0)
obj.combinations(n, result, 0, 0)
print "Ways "
puts (instance.Way(n))











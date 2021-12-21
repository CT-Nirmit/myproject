#! user/bin/ruby

class Opeation
   def occurence(arr,a)
      arr1=[]
for i in 0 .. (a-1)
  for j in (i+1) .. (a-1)
     if arr[i] == arr[j] 
      c=arr[j]  
      x=arr.index(c)
      arr1.append(c)
     end 
  end
end

x=arr1[0]
b=arr.index(x)
count=arr.count(x)
puts "#{x} is first index of #{b} count #{count}"    
   end
end

puts "enter the array size"
a=gets.chomp.to_i
arr=[ ]
for i in 0 .. (a-1)
    puts "enter the array number"
    num= gets.chomp.to_i 
    arr.append(num)
end
incetance=Opeation.new
incetance.occurence(arr,a)


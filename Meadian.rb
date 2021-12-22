# Meadian running Striming



#! user/bin/ruby

class Opeartion
  
   def meadian(arr)
    sum=0
    arr1=arr.sort()
    puts "#{arr.sort()}"
    if (arr1.length)%2==0
    
     len=arr1.length/2
     
     sum=arr1[len].to_i - arr1[len-1].to_i
     dif=sum.fdiv(2)
     meadian=arr1[len-1].to_i + dif       
    else 
      len=((arr1.length))/2
      meadian=arr1[(len)]
    end
     puts "#{meadian}" 
  end
end

arr=[]
incetance=Opeartion.new

loop do
   i=gets.chomp
   if i =='exit'
      break
   end
  
   arr.append(i)
   incetance.meadian(arr)
end
   
  

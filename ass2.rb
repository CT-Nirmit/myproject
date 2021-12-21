#! user/bin/ruby

class Operations
   def uniq_value(arr,a)
      arr1=arr.uniq 
      for i in arr1
        count=arr.count(i)
        puts "#{i} is occurence #{count}"
      end
   end
end



a=gets.chomp.to_i
arr=[]
for i in 0 .. (a-1)
     puts "enter the array number"
     num=gets.chomp.to_i
     arr.append(num)
end

list= Operations.new
list.uniq_value(arr,a)


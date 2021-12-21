
class Op
 

    def dis(text)
       puts text
    end

    def add(a,b)
        puts "add"
        return (a.to_i) +(b.to_i)
    end
    def sub(a,b)
       return (a.to_i) -(b.to_i)
    end
    def mul(a,b)
       return (a.to_i) *(b.to_i)
    end
    def div(a,b)
      return (a.to_i) /(b.to_i)
    end
    def first_num(text)
      arr=text.split('')
      return arr[0]
    end
    def second_num(text)
       arr=text.split('')
       return arr[1]
    end
    def third_num(text)
        arr=text.split('')
        return arr[2]
    end
    def four_num(text)
       arr=text.split('')
       return arr[3] 
    end
    def fifth_num(text)
       arr=text.split('')
       return arr[4]
    end
end
puts "enter the context"
context=gets.chomp
puts "enter the text"
text=gets.chomp

instance=Op.new()

if context == "enter characters as displayed in image"
   instance.dis(text)
elsif context == "evaluate the expression"
   arr=text.split('')
   c=arr[1]
   a=arr[0]
   b=arr[2]
   puts "run"
   if c== '+'
     puts(instance.add(a,b))
   
   elsif c== '-'
     puts(instance.sub(a,b))
   
   elsif c== '*'
     puts(instance.mul(a,b))
  
   elsif c== '/'
     puts(instance.div(a,b))
   else
     puts "worng operation"
   end 

elsif context=="enter the first number"
        puts(instance.first_num(text))
elsif context=="enter the second number"
       puts(instance.second_num(text))
elsif context=="enter the third number"
       puts(instance.third_num(text))
elsif context=="enter the fourth number"
       puts(instance.four_num(text))
elsif context=="enter the fifth number"
       puts(instance.four_num(text))
else 
       puts "Wrong Input"
end






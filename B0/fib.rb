require 'matrix'

def fib(n)
    m0 = Matrix[[1,1],[1,0]]
    m=Matrix.column_vector([1,1])
    for i in 1.. n
       m = m0*m
    end
end
while 0
    puts "please input 1-100 interger"
    temp = gets
    i = temp.to_i
    if (!i.is_a?(Integer))
       puts "please input a integer"
    elsif i<1 || i > 100
       puts "the number of 1~100"
    else 
       puts "#{fib(n)}"
 end
end
 
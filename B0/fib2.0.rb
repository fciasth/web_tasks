###########################
#@author:fciasth
#@data:July 30, 2015
#
#
###########################
require 'matrix'

def fib(n)
    m0 = Matrix[[1,1],[1,0]]
    m=Matrix.column_vector([1,1])#初始迭代值
    for i in 1.. n
       m = m0*m
    end
    return m[1,0]
end
while true
    puts "please input 1-100 interger"
    i = gets.chomp
    if (i.to_i.to_s!=i)#判断是否为整数
       puts "please input a integer"
    elsif i.to_i<1 || i.to_i > 100#判断范围
       puts "the number of 1~100"
    else 
       puts "#{fib(i.to_i)}"
 end
end
 
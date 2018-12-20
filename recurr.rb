require 'pp'
# programme to demonstrate recursion


def recurr(str,i,accumulator)
 accumulator << str[i].split('')
 if i< str.size-1
	i=i+1
	recurr(str,i, accumulator)
	puts
 end
return accumulator
end

def makestring(str)
whole_set= recurr(str,0,[])
cartesian_pool = whole_set[1..-1].inject(whole_set[0]){ |m,v| m = m.product(v).map(&:flatten) }

return cartesian_pool.map { |m| pp m.join('') }
end

str=['abc','def','ijk']
print makestring(str)

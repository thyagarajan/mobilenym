# code challenge of iccle technologies
# challenge wrtten by S Thyagarajan email citizenofgnu@gmail.com mobile:9840414445

require 'pp'
require 'ruby-dictionary'

class MobileNym
attr_accessor :output_array
def initialize(number)
  @mobileNum = number.to_s
  @dictionary = Dictionary.from_file('./dictionary.txt', ' ')
  @dialPadHash =  { "2" => ['a','b','c'],"3"  => ['d','e','f'],"4"=> ['g','h','i'],"5" => ['j','k','l'],"6" => ['m','n','o'],"7" => ['p','q','r','s'],"8" =>['t','u','v'] ,"9"=> ['w','x','y','z']}
  @output_array = []
end

def makestring(incoming_array)
  whole_set = incoming_array
  cartesian_pool = whole_set[1..-1].inject(whole_set[0]){ |m,v| m = m.product(v).map(&:flatten) }
  return cartesian_pool.collect { |m|  m.join('') if @dictionary.exists?(m.join{''})   }
end

def wordsForNum
  @numberArray = []
  for i in (2..6) do
    string_one = "^[2-9]{"+"#{i+1}"+"}"
    leading_pattern = Regexp.new string_one
    string_two = "[2-9]{"+"#{10-(i+1)}"+"}$"
    trailing_pattern = Regexp.new string_two
    if @mobileNum.scan(leading_pattern) != [] && @mobileNum.scan(trailing_pattern) !=[]
      @numberArray << [makestring(@mobileNum.scan(leading_pattern).first.split('').map{ |k| @dialPadHash[k] }).compact,",", makestring(@mobileNum.scan(trailing_pattern).last.split('').map{ |k| @dialPadHash[k] }).compact]
    end 
  end

   @numberArray.each do |cell|
	 if cell.first !=[] && cell.last !=[]
          cell.first.each do |first_syllable|
            cell.last.each do |last_syllable|
               @output_array.push([first_syllable,last_syllable])
            end
        end
      end	
   end
@output_array.push(makestring(@mobileNum.split('').map{ |k| @dialPadHash[k] }).compact) if @mobileNum.scan(/^[2-9]{10}$/) !=[]
end
def test_stub
wordsForNum if @mobileNum.scan(/^[2-9]{10}$/) !=[]
self.output_array.last
end
end

instance = MobileNym.new("22826hello")
pp instance.wordsForNum

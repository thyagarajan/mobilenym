# code challenge of iccle technologies
# challenge wrtten by S Thyagarajan email citizenofgnu@gmail.com mobile:9840414445

require 'pp'
require 'ruby-dictionary'

class MobileNym
attr_accessor :output_array
def initialize(number)
  @mobileNum = number.to_s
  @dictionary = Dictionary.from_file('./dictionary.txt', ' ')
  @dialPadHash =  { "2" => "abc","3"  =>"def","4"=> "ghi","5" => "jkl","6" => "mno","7" => "pqrs","8" =>"tuv" ,"9"=> "wxyz"}
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
    string_one = "^[0-9]{"+"#{i+1}"+"}"
    leading_pattern = Regexp.new string_one
    string_two = "[0-9]{"+"#{10-(i+1)}"+"}$"
    trailing_pattern = Regexp.new string_two
    @numberArray << [makestring(@mobileNum.scan(leading_pattern).first.split('').map{ |k| @dialPadHash[k].split('') }).compact,",", makestring(@mobileNum.scan(trailing_pattern).last.split('').map{ |k| @dialPadHash[k].split('') }).compact]
  end

   @numberArray.each do |cell|
	 if cell.first !=[] 
	   if cell.last !=[]
          cell.first.each do |first_syllable|
            cell.last.each do |last_syllable|
               @output_array.push([first_syllable,last_syllable])
            end
          end
        end
      end	
   end
@output_array.push(makestring(@mobileNum.split('').map{ |k| @dialPadHash[k].split('') }).compact)
end
def test_stub
wordsForNum
self.output_array.last
end
end

instance = MobileNym.new("6686787825")

pp instance.wordsForNum

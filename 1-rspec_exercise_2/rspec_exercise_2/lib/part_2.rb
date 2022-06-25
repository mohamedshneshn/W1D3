
# should accept a string as an arg (FAILED - 1)
# should not use String#reverse (FAILED - 2)
# when the string is the same forwards and backwards
#   should return true (FAILED - 3)
# when the string is not the same forwards and backwards
#   should return false (FAILED - 4)

  def palindrome?(str)
    strBack=""
    i=str.length-1
    while i >= 0
        strBack+=str[i]  # if string[i] == string[-i - 1]
        i-=1
    end
    
    str == strBack
  end
#   --------------------------------------------------------------------------
# should accept a string as an arg (FAILED - 1)
# should return an array containing all substrings of the given string (FAILED - 2)
def substrings(str)
    arr=[]                                                         ########
    str.each_char.with_index do |char1,idx1|
        
        (idx1..str.length-1).each do |idx2|
                arr<<str[idx1..idx2]
        end
    end
    arr
end
# ---------------------------------------------------------------------------------
# should accept a string as an arg (FAILED - 1)
# should return an array containing all substrings that are palindromes and longer than 1 character (FAILED - 2)
# should call your previous 'palindrome?' method (FAILED - 3)
# should call your previous 'substrings' method (FAILED - 4)
def palindrome_substrings (str)
    substrings(str).select { |ele| palindrome?(ele) && ele.length >1 }
    
end
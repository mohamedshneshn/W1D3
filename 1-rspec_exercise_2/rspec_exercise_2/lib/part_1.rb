
# should accept an array and a number as args
# should return a 2D array of length 2 where the first subarray contains elements less than
#  the number arg and the second subarray contains elements greater than or 
#  equal to the number arg

def partition (array,num)
newArr=[[],[]]
array.each_with_index do |ele,i|
    if ele < num
        newArr[0] <<ele
    else
        newArr[1] << ele
    end
end
newArr
end
# ---------------------------------------------------------------------
# should accept two hashes as args (FAILED - 1)
# should return a new hash representing containing key-value from both hashes (FAILED - 2)
# should take the value from the second hash if the two hashes have duplicate keys (FAILED - 3)
# should not mutate the two input hashes (FAILED - 4)
# should not use the built-in Hash#merge method (FAILED - 5)
def merge (hash1,hash2)
    newHash=Hash.new(0)  #newHash={}
    hash1.each do |k,v|
        newHash[k]=v
    end
    hash2.each do |k,v|
        newHash[k]=v
    end
    newHash
end
# --------------------------------------------------------------------------
# should accept a sentence and an array of curse words as args (FAILED - 1)
# should return the sentence where every curse word has it's vowels replaced with '*' (FAILED - 2)


def censor (str,arr)
    newArr=str.split(" ").map do |word| # map return new arr
        if arr.include?(word.downcase)
           swap_vowel(word)
        else
            word
        end
    end
    newArr.join(" ")
end
def swap_vowel (word)
    vowels="aeiouAEIOU"
    newWord=""
    word.each_char do |char|
        if vowels.include?(char)
            newWord += "*"
            else
                newWord += char
        end
    end
    newWord
end
# --------------------------------------------------------------------------------------
# should accept a number as an arg (FAILED - 1)                 #########
# should not use the built-in Math#log methods (FAILED - 2)
# when the number is a power of two
# should return true (FAILED - 3)
# when the number is not a power of two
# should return false (FAILED - 4)
def power_of_two?(num)#4      #5
    i = 1
  while i < num #1 4 2 4      #1 5   2 5  4 5
    i *= 2      #2   4        #2     4    8
  end

  i == num
end
# ------------------------------------------------------------------------
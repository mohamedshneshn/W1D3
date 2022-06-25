# accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements that have a
#  sum of zero. 
# You may assume that the input array contains unique elements.
def strange_sums(arr)
    count = 0
    arr.each_with_index do |n1, idx1|
        arr.each_with_index do |n2, idx2|
            if idx2 > idx1 && (n1 + n2) == 0
                count += 1
            end
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0
# -----------------------------------------------------------------------------
# accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements
#  in the array result in the product when multiplied together.


def pair_product(arr, product)
    arr.each_with_index do |n1, idx1|
        arr.each_with_index do |n2, idx2|
            if idx2 > idx1 && (n1 * n2) == product
                return true
            end
        end
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# ---------------------------------------------------------------------
# accepts a string and a hash as arguments. 
# The method should return a new string where characters of
#  the original string are repeated the number of times specified by the hash. 
#  If a character does not exist
#  as a key of the hash, then it should remain unchanged
def rampant_repeats(str, hash)
    newString = ""
    str.each_char do |char|
        if hash.has_key?(char)
            newString += char * hash[char]
        else
            newString += char
        end
    end
    newString
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})               # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})   # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})            # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})              # 'faaaarm'
# ---------------------------------------------------------------------------------
# that accepts a number as an argument. The method should return a boolean indicating 
# whether or not the argument is a perfect square.
def perfect_square(num)
    (1..num).any? { |n| n * n == num }
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false
# -----------------------------------------------------------------
# accepts a number as an argument. The method should return true if the 
# given number has more divisors than all positive
#  numbers less than the given number.
def count_factors(num)                      #24
    (1..num).count { |i| num % i == 0 }    # return num of factor 1, 2, 3, 4, 6, 8, 12, 24=8
end

def anti_prime?(num)
    mainCount = count_factors(num)               #=8
    (1...num).all? { |i| mainCount > count_factors(i) }  #(1...24).all? {|i| 8 > count_factors(i) }
end

# p anti_prime?(24)     # true
# p anti_prime?(36)     # true
# p anti_prime?(48)     # true
# p anti_prime?(360)    # true
# p anti_prime?(1260)   # true
# p anti_prime?(27)     # false
# p anti_prime?(5)      # false
# p anti_prime?(100)    # false
# p anti_prime?(136)    # false
# p anti_prime?(1024)   # false

# ------------------------------------------------------------

# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts 
# two matrices as arguments. The two matrices are guaranteed to have the same "height" 
# and "width". The method should return a new matrix representing the sum of
#  the two arguments

def matrix_addition(m1, m2)
#   newArr=Array.new(m1.length) { [0] * m1[0].length }    
    newArr=Array.new(m1.length) { Array.new(m1[0].length)  }                #[[2,5], [4,7]]   [[11, 6], [7, 7]]
                                                                             #[[9,1], [3,0]]  
                                       
   (0...m1.length).each do |i|
    (0...m1[0].length).each do |j|
        newArr[i][j] = m1[i][j]+m2[i][j]  #newArr[0][0]
    end
   
   end 
   newArr
end

# def matrix_addition(m1, m2)
#     height = m1.length
#     width = m1[0].length
#     result = Array.new(height) { [0] * width }

#     (0...height).each do |row|
#         (0...width).each do |col|
#             result[row][col] = m1[row][col] + m2[row][col]
#         end
#     end

#     result
# end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
# ----------------------------------------------------------------------------------------

# that accepts any amount of numbers as arguments. The method should
#  return an array containing all of the common
#  divisors shared among the arguments

def mutual_factors(*nums) #(8, 4, 10) 
    
    nums.map! {|num| factors(num)}  #nums [[1,2,4],[1,2,4,8],[1,2,5,10]]-----[1,2]
   
     output=[]
     i=0
     while i< nums[0].length
        num=nums[0][i]
       if nums.all? {|arr| arr.include?(num)}
        output<< num
       end
       i+=1
        end
        output
    end

def factors (num)     # take number & return arr of factors
    (1..num).select {|n| num % n == 0}
end

# def factors(num)
#     (1..num).select { |i| num % i == 0}
# end

# def mutual_factors(*nums)
#     nums
#         .map { |n| factors(n) }
#         .inject(:&)
# end

# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# ---------------------------------------------------------------------

# that accepts a number argument, n, and returns the n-th 
# The first three numbers of the tribonacci sequence are 1, 1, and 2
# . To generate the next number of the sequence, 
# we take the sum of the previous three numbers
# number of the tribonacci sequence.
def tribonacci_number(n)      #5

   arr=[1,1,2]              #[1,1,2,4,7] => 7
   return 1 if n==1 ||n==2
   return 2 if n==3
   if n>3
   (n-3).times {arr<< arr[-1] +arr[-2]+arr[-3]}
   return arr[-1]
   end
end

# def tribonacci_number(n)
#     seq = [1, 1, 2]
#     while seq.length <= n
#         seq << seq[-3] + seq[-2] + seq[-1]
#     end
#     seq[n - 1]
# end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# -------------------------------------------------------------------------------------------------
def matrix_addition_reloaded(*matrices)

#  newArr=Array.new(m1.length) { Array.new(m1[0].length)  }              
# (0...m1.length).each do |i|
# (0...m1[0].length).each do |j|
# newArr[i][j] = m1[i][j]+m2[i][j]  #newArr[0][0]
# end

# end 
# newArr
# end
    matrix = matrices.first 
    height = matrix.length #2
    width = matrix[0].length #2

     empty_matrix = Array.new(height) { [0] * width }

    matrices.inject(empty_matrix) do |m1, m2|
        return nil if m2.length != height or m2[0].length != width
        print m1
        puts
        print m2
        matrix_addition(m1, m2)
    end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil



def squarocol?(grid)
    return true if grid.any? { |row| row.uniq.length == 1 }
    return true if grid.transpose.any? { |col| col.uniq.length == 1 }
    false
end

# p squarocol?([
#     [:o, :x , :o],
#     [:o, :x , :o],
#     [:o, :x , :o],
# ]) # true
# p squarocol?([
#     [:o, :o, :o],
#     [:o, :o, :o],
#     [:x, :x, :x],
# ]) # true
# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def adjacent_sums(arr)
    sums = []
    (0...arr.length-1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(n)
    triangle = [[1]]
    while triangle.length < n
        level_above = triangle.last
        next_level = [1]
        next_level += adjacent_sums(level_above)
        next_level << 1
        triangle << next_level
    end
    triangle
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]
#
# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]


def prime?(num)
    return  false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def mersenne_prime(n)
    x = -1
    count = 0
    while count < n
        x += 1
        candidate = 2**x - 1
        count += 1 if prime?(candidate)
    end
    2**x - 1
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071


def triangular_sequence(n)
    seq = []
    i = 1
    while i <= n
        seq << (i * (i + 1)) / 2
        i += 1
    end
    seq
end

def triangular_word?(word)
    alpha = ('a'..'z').to_a
    value = word
        .split('')
        .map { |char| alpha.index(char) + 1 }
        .sum
    triangular_nums = triangular_sequence(value)
    triangular_nums.include?(value)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def collapse(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
            return nums[0...i] + nums[i + 2..-1]
        end
    end

    nums
end

def consecutive_collapse(numbers)
    numbers.each { numbers = collapse(numbers) }
    numbers
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []


def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end

    prime_count = 0
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    number
end

def pretentious_primes(numbers, n)
    numbers.map { |num| next_prime(num, n) }
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

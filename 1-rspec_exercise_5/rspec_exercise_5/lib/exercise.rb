
def zip (*arrays) #should accept any number of arrays of the same length as arguments
                  #should return a 2D array where each subarray contains the elements at the
                  #same index from each argument
                  #[['a', 'b', 'c'], [1, 2, 3]] => [['a', 1], ['b', 2], ['c', 3]]
   newArr=Array.new(arrays[0].length){Array.new(arrays.length)}

    arrays.each_with_index do |array, i|
    array.each_with_index do |element, j|   #[a, b, c]
    newArr[j][i] = element                  #[a,]   [b,]   [c,]      
    end
    
  end
    newArr
end
# there is 2 way to create a new array
# array=[]    # prefed for single array
# or
# array=Array.new(length) {default_value} #preferd for 2D array
# array=Array.new(2){0} #[0, 0]
# note default_value may be a new array or a new hash
# array=Array.new(3){Array.new(3){0}} #[[0, 0, 0], [0, 0, 0], [0, 0, 0]]
# note you cant not put the default_value it is ok it gonna be nil
# array=Array.new(3) {Array.new(3)}   #[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]] 
# ---------------------------------------------------------------------------------------------------------------------
def prizz_proc(arr,prc1,prc2) #should accept an array and two procs as arguments
                            #should return a new array containing the elements that return true for exactly one of the procs
                            #[10, 9, 3, 45, 12, 15, 7], div_3, div_5
                            #[10, 9, 3, 12]
                            
 newArr=[ ]
    arr.each do |ele|   #[10, 9, 3, 45, 12, 15, 7]
        if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
            newArr << ele
        end
    end
    newArr
end
# ---------------------------------------------------------------------------------------------------------------------

 #should accept any number of arrays of the same length as arguments
 #should return a 2D array where each subarray contains the elements at
 # the same index from each argument
 #[['a', 'b', 'c'], [1, 2, 3]] => [['a', 1], ['b', 2], ['c', 3]]
 #should use nil to substitute elements for the array that are too short
#[['a', 'b', 'c'], [1, 2, 3, 4]] => [['a', 1], ['b', 2], ['c', 3], [nil, 4]]
def zany_zip(*arrays)
#get the length of the longest array
newArrLength=[]  
arrays.each do |array|
        newArrLength << array.length
end
maxLength=newArrLength.max      
arrays.each do |array|
    while array.length < maxLength
        array << nil
    end
end 
  zip(*arrays)

end
# ---------------------------------------------------------------------------------------------------------------------
def maximum(arr, &prc) #should accept an array and a block as arguments
                        #should return the element that returns the largest value when passed to the block
                        #[1, 3, 5, 7] => 7
   return nil if arr.empty?
   newArr=[]
   arr.each do |ele|
       newArr << prc.call(ele)
   end
    max=newArr.max
    arr.reverse.each do |ele|
        return ele  if prc.call(ele) == max 
    end

end
# ----------------------------------

def my_group_by(arr, &prc) #should accept an array and a block as arguments
                            #should return a hash where the keys are the return values of the block
                            #and the values are arrays of the elements that correspond to those keys
                            #['mouse', 'dog', 'goat', 'bird', 'cat']
                             #{5=>["mouse"], 3=>["dog", "cat"], 4=>["goat", "bird"]} 
   hash=Hash.new { |h, k| h[k] = [] }
   arr.each do |ele|
               hash[prc.call(ele)] << ele   
   end
   hash                
                     
end
# ---------------------------------------------------------------------------------------------------------------------
  
#should accept an array and a block and a second block as arguments


def max_tie_breaker(arr,proc, &prc) 
    return nil if arr.empty?  #should return nil if the array is empty
    max=arr.first
    arr.each do |ele|
        if prc.call(ele) > prc.call(max) 
            max = ele
        elsif prc.call(ele) == prc.call(max) && proc.call(ele) > proc.call(max)
            max = ele
        end
    end

    return max
end
# ---------------------------------------------------------------------------------------------------------------------
#should return a new sentence where all letters before the first vowel
# and after the last vowel are removed
#should not remove letters for words that contain less than two vowels
#'properly and precisely written code'= ope and ecise itte ode
def silly_syllables(sentence) #should accept a string as an argument
    vowels=['a','e','i','o','u']
    newSent=[]
    sentence.split(" ").each do |word|
        if word.split("").count {|char| vowels.include?(char)} < 2
            newSent << word
        else
            newSent << change_word(word)
        end
    end
    newSent.join(" ")
end


def vowel_indices (word)  #apple
    vowels="aeiou"
    indices=[]         
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            indices << i
        end
    end
    indices #   [0, 4]
end

def change_word(word)   #apple
        indices = vowel_indices(word) #  [0, 4]
        word[indices.first..indices.last]  # apple                

 end

# --------------------------------------------------------------------------------

def arr_sort(arr) [3,50,7,8]

    sorted=false
    while !sorted
        sorted=true
        (0...arr.length-1).each do |i|
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted=false
            end
        end
    end
    arr

  

end
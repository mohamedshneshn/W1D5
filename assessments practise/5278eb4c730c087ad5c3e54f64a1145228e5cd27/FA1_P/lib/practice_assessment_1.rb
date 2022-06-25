
def first_letter_vowel_count (sent)
vowels="aeiouAEIOU"
sent.split(" ").count {|ele| vowels.include?(ele[0])}
end
# --------------------------------------------------------------
def count_true (arr,prc)

    arr.count {|ele| prc.call(ele)}
end
# ----------------------------------------------------------------
def procformation (arr,prc1,prc2,prc3)
    
    arr.map {|ele| prc1.call(ele) ?  prc2.call(ele) : prc3.call(ele)}
  
end
# --------------------------------------------------------------------

def array_of_array_sum (arr)

    arr.flatten.sum
end
# -------------------------------------------------------------------

def selective_reverse (sent)
    vowels="aeiouAEIOU"
    sent.split(" ").map { |word| (vowels.include?(word[0]) || vowels.include?(word[-1])) ? word : word.reverse }.join(" ")
        
    end
# ------------------------------------------------------------------------------
 def hash_missing_keys (hash,*args)
   
    args.select {|ele|  !hash.has_key?(ele)}
 end
# -----------------------------------------------------------------------------



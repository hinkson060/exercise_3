module FunWithStrings
  def palindrome?
    forward = self.gsub(/\W/, "").downcase
    reverse = forward.reverse
    forward == reverse
  end
  def count_words
    words = self.split
    words.map! { |word| word.gsub(/\W/, "").downcase }
    word_count = Hash.new(0)
    words.each { |word| word_count[word] += 1 if word != "" }
    word_count
  end
  def anagram_groups
    words = self.split
    words.group_by { |word| word.downcase.chars.sort }.values
  end
end

class String
  include FunWithStrings
end

abc = ('a'..'z').to_a
vowels = %w[a e i o u y]

vowels_index = {}

abc.each.with_index(1) { |letter, index| vowels_index[letter] = index if vowels.include?(letter) }

abc = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']

vowels_index = {}
vowels.each { |vowel| vowels_index[vowel] = abc.index(vowel) + 1 }

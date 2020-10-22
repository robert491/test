abc = ('a'..'z').to_a
vowels = ['a', 'e', 'i', 'o', 'u', 'y']

serial_numbers = []
vowels.each { |vowel| serial_numbers << abc.index(vowel) + 1 }

vowels_index = vowels.zip(serial_numbers).to_h

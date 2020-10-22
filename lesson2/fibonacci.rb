array = [0, 1]

array << array.last(2).sum while array.last(2).sum < 100

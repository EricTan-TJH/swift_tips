//Use allSatisfy to quickly check if all elements in a collection meet a specific condition. Instead of manually iterating through a collection, you can use allSatisfy to simplify your code.

// Example #1
let numbers = [1, 2, 3, 4, 5]

// Check if all numbers are even
let allEven = numbers.allSatisfy { $0 % 2 == 0 }

print(allEven)
// Output: false

// Example #2
let names = ["Alice", "Bob", "Charlie", "David", "Eva"]

// Check if all names have a length greater than 3
let allNamesLongerThanThree = names.allSatisfy { $0.count > 3 }

print(allNamesLongerThanThree)
// Output: false

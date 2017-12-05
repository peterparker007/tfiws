//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["cherry","strawberry","apple","banana", "kiwi"]


//sorted by method
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by:backward)

//inline closure
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})



reversedNames = names.sorted(by: {
    s1, s2 in return s1 > s2 } )


reversedNames = names.sorted(by: { $0 > $1 } )
print(reversedNames)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510,15]

let strings = numbers.map { //array
    
    (number) -> String in
    
    var number = number
    var output = ""
   
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(strings[2])


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()


let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()



var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
print(customerProvider())

// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"


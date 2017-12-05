//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let i=5+4

//Assignment operator

let b = 10
var a = 5
a = b
print(a)
// a is now equal to 10


//Arithmetic Operators
5+6
9-5
2*3
9/3






//string concatenation:
"hello, " + "heli"  // equals "hello, heli"

//Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

//Unary Plus operator
let minusSix = -6
let alsoMinusSix = +minusSix //(-6+6=-6)

//Comparison Operators

//Equal to 
(a == b)
//Not equal to 
(a != b)

//Greater than
(a > b)

//Less than 
(a < b)

//Greater than or equal to 
(a >= b)

//Less than or equal to 
(a <= b)

//Comparison operators are often used in conditional statements, such as the if statement:

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

let name1 = "a"
if name1 == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name1), but I don't recognize you")
}

//Ternary Conditional Operator

let contentHeight = 40.0
let hasHeader = true
let rowHeight = contentHeight + (contentHeight<40.1 ? 50 : 20)
// rowHeight is equal to 90



//Nil-Coalescing Operator

let defaultColorName = "red"
var userDefinedcolorName: String?

var colorNameToUse = userDefinedcolorName ?? defaultColorName


let defaultColorName1 = "red"
var userDefinedcolorName1 = "blue"

var colorNameToUse1 = userDefinedcolorName1 ?? defaultColorName
print(colorNameToUse)
//Range Operator
for i in 1...5 {
    print("\(i) times 5 is \(i * 5)")
}


//Logical AND Operator

let aa = true
let bb = true
if aa && bb {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome"

//only allows access if both values are true:



let xx = true
let yy = false
if xx && yy {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"



//Logical OR
//If any one value is true than return true
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

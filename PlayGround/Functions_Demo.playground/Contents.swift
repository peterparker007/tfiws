//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String) -> String
{
    let greeting = "Hello, " + person + ""
    return greeting
}

print (greet(person: "Heli"))


func greetAgain(person: String) -> String {
    return "Hello again, " + person + ""
}

print (greetAgain(person:"Heli"))

//Functions Without Parameters

func sayHelloWorld() -> String
{
    return "Hello World"
}
print(sayHelloWorld())


//Function with multiple parameters


func greet(person: String, alreadyGreeted: Bool) -> String
{
    if alreadyGreeted{
    return greetAgain(person: person)
    }else{
        return greet(person:person)
    }
}
print(greet(person: "Heli", alreadyGreeted: true))


//Functions Without Return Values

func greet1(person: String) {
    print("Hello, \(person)!")
}
greet1(person: "Dave")
// Prints "Hello, Dave!"


//Functions with Multiple Return Values

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[6]
    var currentMax = array[5]
    for value in array[1..<array.count] {
        
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//Min - Max Value
let bounds = minMax(array: [8, -6, 2, 109, 3, 71,6])

print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"


func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12


//Variadic Parameters

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

//In-Out Parameters
var Inta = 3
var Intb = 5
swap(&Inta, &Intb)
print("Inta is now \(Inta), and Intb is now \(Intb)")


//Function Types

//“A function type that has two parameters, both of type Int, and that returns a value of type Int.”

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// void return type
func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

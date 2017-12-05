//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Heli"
var welcomeMessage: String
welcomeMessage = "Welcome to zaptech"
let π = 3.14159
let 🐶🐮 = "dogcow"


//You can change the value of an existing variable to another value of a compatible type. In this example, the value of friendlyWelcome is changed from "Hello!" to "Bonjour!":

var friendlyWelcome = "Heli!"
friendlyWelcome = "Bonjour!" // friendlyWelcome is now "Bonjour!"

let x=10 //Constant Value

var a:String // Variable Declaration
 a = "Heli!"
print(a)

let b=10;
print(b);

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8


let anotherPi = 3 + 0.14159

let decimalInteger=17
let binaryInteger=0b10001
let octalInteger=0o21
let hexadecimalInteger=0x11

let twothousand: UInt16=2000
let one: UInt8 = 1
let twothousandandAndOne=twothousand+UInt16(one)

let integerPi = Int(π)

let http=(404, "Request Not Found")

let (errorCode, errorMessage) = http

print("The status code is : \(errorCode)")
print("The Error Message is : \(errorMessage)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


//if 

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}


if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}
// Prints ""123" has an integer value of 123"


//Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

//If Statements and Forced Unwrapping
if let firstNumber = Int("40"),
    let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"


//error handling
func canThrowAnError() throws {
    // this function may or may not throw an error
}

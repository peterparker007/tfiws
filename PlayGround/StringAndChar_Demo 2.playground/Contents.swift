//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//String  Literals
//Use a string literal as an initial value for a constant or variable:

let someString = "Some string literal value"

var emptyString = ""               // empty string literal

//String Mutability

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"



for character in "Dog!🐶".characters {
print(character)
}
//String values can be constructed by passing an array of Character values as an argument to its initializer

let heliCharacters: [Character] = ["H", "e", "l", "i"]

let heliString = String(heliCharacters)
print(heliString)



//Concatenating Strings and Characters

let alphabet : [NSNumber] = [1 , 2 ,3 ,4]
print(alphabet)

let str1="hello"
let str2=" heli"
var concate = str1 + str2


var instruction = "look over"
instruction += str2

// string interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"


//Special Characters in String Literals

let dollarSign = "\u{24}"
print(dollarSign)
let  modulo = "\u{25}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
let sparklingHeart1 = "\u{1F497}"
let sparklingHeart2 = "\u{1F498}"
let babychick = "\u{1F425}"

let enclosedEAcute: Character = "\u{E8}\u{20DD}"

let unusualCount = "Heli,shah   "
print("unusualMenagerie has \(unusualCount.characters.count) characters")

let greeting = "Heli Shah!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//Inserting and Removing

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

//String and Character Equality
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

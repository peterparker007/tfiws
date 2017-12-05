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



for character in "Dog".characters {
print(character)
}
//String values can be constructed by passing an array of Character values as an argument to its initializer

let heliCharacters: [Character] = ["H", "e", "l", "i"]

let heliString = String(heliCharacters)
print(heliString)

var someInts = [1,2,3,4]
    print("someInts is of type [Int] with \(someInts.count) items.")

someInts += [5]
someInts[1...4]
 print(someInts[0...someInts.count-1])
someInts.remove(at: 0)
 print(someInts[0...someInts.count-1])
someInts.insert(0,at: 0)
 var airports = ["YYZ": "Toronto Pearson", "DUB": "a","DUB1": "b","DUB2": "c"]
        // let oldValue = airports.updateValue("Heli", forKey: "DUB")
         //       print("The old value for DUB was \(oldValue).")
for a in airports.values {
            print("\(a)")
}

    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base;
                    }
    print("\(base) to the power of \(power) is \(answer)")
        // Prints "3 to the power of 10 is 59049"

            let someCharacter: String = "Bhumesh"
    switch someCharacter {
        case "Bhumesh":
            print("The first letter of the alphabet")
        case "Bhumesh":
                print("The last letter of the alphabet")
                default:
                print("Some other character")
        }
   let somePoint = (1, 1)
        switch somePoint {
            case (0, 0):
                print("\(somePoint) is at the origin")
            case (_, 0):
                print("\(somePoint) is on the x-axis")
            case (0, _):
                print("\(somePoint) is on the y-axis")
            case (-2...2, -2...2):
                print("\(somePoint) is inside the box")
            default:
                print("\(somePoint) is outside of the box")
            }
//Concatenating Strings and Characters

let alphabet : [NSNumber] = [1 , 2 ,3 ,4]
print(alphabet)

let str1="helh"
let str2=" heli"
var concate = str1 + str2
if(str1>str2)
{
    print("yes")
}
else
{
    print("NO")
}


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

let enclosedEAcute: Character = "\u{1F425}\u{20DD}"

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

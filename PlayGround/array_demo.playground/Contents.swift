//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

someInts.append(3)
print(someInts[0])
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder","Chocolate Spread", "Cheese", "Butter"]
shoppingList[0...5] = ["Bananas", "Apples" ]
print(shoppingList)


let integerToDescribe = 6
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 1,  3,  5, 7,9:
    description += " odd"
    break
case  2,  4,  6, 8:
    description += " even"
    fallthrough
default:
    description += " an integer."
}
print(description)

func add (num:NSInteger,num2:NSInteger)->NSInteger
{
    return num + num2
}
print(add(num: 50,num2: 6))


func fullname(firstname:String,lastname:String)->(fname:String,lname:String)
{
    
    return (firstname+"!" , lastname+"!")
}

let name=fullname(firstname:"abc", lastname: "def")
print(name.fname)
print(name.lname)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

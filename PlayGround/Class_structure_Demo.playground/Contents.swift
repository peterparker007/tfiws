//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class A{

// Define classes
}

struct B
{
    // Define structure
}

struct Resolution
{
    var width=0;
    var height=0;
}

class VideoMode
{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
   
    var name : String = "abc"
   
    
   
  
    
}

let someResolution = Resolution()
let someVideoMode = VideoMode()


print("The width of someResolution is \(someResolution.height)")

// Prints "The width of someResolution is 0"
let vga = Resolution(width: 640, height: 480)

var hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print(hd)

print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"






let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "heli"
tenEighty.frameRate = 25.0

var h=tenEighty

h.name="nilomi"
print(h.name)
print(tenEighty.name)

print(Resolution())
print(tenEighty.name)
print(tenEighty.frameRate)

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)



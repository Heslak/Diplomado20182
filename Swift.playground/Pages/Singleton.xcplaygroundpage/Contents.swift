//: [Previous](@previous)

import Foundation

class MySingleton {
    static let sharedInstance =  MySingleton()
    var number = 0
    private init(){}
}

var singleA: MySingleton = MySingleton.sharedInstance
var singleB: MySingleton = MySingleton.sharedInstance
var singleC: MySingleton = MySingleton.sharedInstance

singleA.number=2
print(singleA.number)
print(singleB.number)
print(singleC.number)

singleA.number=3
print(singleA.number)
print(singleB.number)
print(singleC.number)




//: [Next](@next)

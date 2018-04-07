//: [Previous](@previous)

import UIKit

let numbers = [2,4,31,3,56,42,14]

func compareAscending(i: Int, j: Int) -> Bool{
    return i < j
}

let sortedNumbers = numbers.sorted(by: compareAscending)

let sortedNumbers2 = numbers.sorted(by: {
    (i: Int, j: Int) -> Bool in
    return i < j
})

let mappedNumbers =  numbers.map({
    (i: Int) -> Int in
    return i*3
})

let mappedNumbers2 =  numbers.map{
    (i: Int) -> Int in
    return i*3
}


typealias myFunction = (String) -> ()

func repeatPrint(times: Int) -> myFunction {
    func printer(text: String){
        for _ in 1...times{
            print(text)
        }
    }
    return printer
}

let log = repeatPrint(times: 10)

log("Adios")



func addTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

var storedFunc = addTwoNumbers
storedFunc(5,4)

var storedClosure: (Int, Int) -> Int = { (number1,number2) in
    return number1 + number2
}
storedClosure(5,4)

var storedClosure2: (Int,Int) -> Int = { $0 + $1 }

//: [Next](@next)

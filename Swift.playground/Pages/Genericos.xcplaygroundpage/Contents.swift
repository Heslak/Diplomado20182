//: [Previous](@previous)

import UIKit

func swapGeneric<generico>(a: inout generico,b: inout generico){
    let temp = a
    a = b
    b = temp
}

var a = 5
var b = 10

swapGeneric(a: &a, b: &b)
print(a,b)

func genericEqual<T :  Comparable>(a: T,b: T) -> Bool{
    return a == b
}

struct List<T>{
    var items = [T]()
    mutating func add(item: T){
        items.append(item)
    }
    func getItemAtIndex(index: Int) -> T?{
        if items.count > index {
            return items[index]
        }else{
            return nil
        }
    }
    
    subscript(index: Int) -> T?{
        return getItemAtIndex(index: index)
    }
    
    subscript(range: CountableClosedRange<Int>) -> [T]{
        get{
            return Array(items[range.lowerBound...range.upperBound])
        }
    }
}

var MyList = List<Int>()

MyList.add(item: 1)
MyList.add(item: 2)
MyList.add(item: 3)

var valores =  MyList[0...2]
print(valores)
var valor = MyList[2]
print(valor!)

/* Generica<T,E>{
 
 }
 enum enumGenerico<T>{
 
 }
 
 let objetoGenerico = Generica<String,Int>()*/

protocol MyProtocol {
    associatedtype E
    var items: [E] { get set }
    mutating func addItem(item: E)
}

struct MyStringType: MyProtocol {
    typealias E = Int
    var items: [Int] = []
    mutating func addItem(item: Int) {
        items.append(item)
    }
}

struct MyGenericStruct<T>: MyProtocol{
    var items: [T] = []
    mutating func addItem(item: T) {
        items.append(item)
    }
}

//: [Next](@next)

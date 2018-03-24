//: [Previous](@previous)

import Foundation

//Actividades
protocol DisplayNameDelegate{
    func displayName(name: String)
}

//Logica de quien se luce
struct Person {
    var displayNameDelegate: DisplayNameDelegate
    
    var firstName = ""{
        didSet{
            displayNameDelegate.displayName(name: getFullName())
        }
    }
    var lastName = ""{
        didSet {
            displayNameDelegate.displayName(name: getFullName())
        }
    }
    init (displayNameDelegate: DisplayNameDelegate){
        self.displayNameDelegate =  displayNameDelegate
    }
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}


//Logica de quien lo va a chambear
struct MyDisplayNameDelegate: DisplayNameDelegate{
    func displayName(name: String){
        print("Name: \(name)")
    }
}

var displayDelegate = MyDisplayNameDelegate()
var person = Person(displayNameDelegate: displayDelegate)
person.firstName = "John"
person.lastName = "Hoffman"
//: [Next](@next)

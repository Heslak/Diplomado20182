//: [Previous](@previous)

import Foundation

class Person {
    var firstName : String
    var lastName : String
    var age : Int
    var id: Int
    static var count: Int = 0
    init (firstName: String, lastName: String){
        self.firstName=firstName
        self.lastName=lastName
        self.age = 1
        Person.count += 1
        self.id = Person.count
    }

    var fullName: String{
        return "\(firstName) \(lastName)"
    }

    static func < (left: Person, right: Person) -> Bool{
        return left.age < right.age
    }
    static func += (left: Person, right: Person) {
        left.age += right.age
    }
}

class Student: Person{
    weak var partner: Student?
    deinit {
        print("\(firstName) fuera...")
    }
}

var Parra: Student = Student(firstName: "Parra", lastName: "Parrita")
var Julio: Student = Student(firstName: "Julio", lastName: "Julito")

Parra.partner = Julio
Julio.partner = Parra

Julio.id
Parra.id
Julio.id

Parra < Julio
Parra += Julio
print(Parra.age)

//: [Next](@next)

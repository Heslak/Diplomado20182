//: [Previous](@previous)

import Foundation

protocol Person {
    var firstName: String {get set}
    init (firstName: String)
    
}

//func updatePerson(person: Person) -> Person {
//    var newPerson: Person
//    return newPerson
//}

var personArray = [Person]()
var personDict = [String: Person]()

struct Student: Person{
    var firstName: String
    init(firstName: String){
        self.firstName = firstName
    }
}

struct Teacher: Person{
    var firstName: String
    init(firstName: String){
        self.firstName = firstName
    }
}

var alumno =  Student(firstName: "Parra")
var profesor =  Teacher(firstName: "Luis")

var academicos: [Person] = []

academicos.append(alumno)
academicos.append(profesor)
var myPerson: Person
myPerson =  Student(firstName: "Parra")
myPerson = Teacher(firstName: "Luis")

print("Mis acadacademicos son: ")
for academico in academicos{
    print("\(academico.firstName)")
}

for academico in academicos where academico is Teacher {
    print("Hay un profe y se llama: \(academico.firstName)")
}

//: [Next](@next)

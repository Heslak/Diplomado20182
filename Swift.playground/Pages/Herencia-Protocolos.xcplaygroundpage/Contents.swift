//: [Previous](@previous)

import Foundation

protocol Evaluable {
    func examinar( Status: inout Bool )
}

extension Evaluable{
    func decidir(Promedio: Float, Status: inout Bool ){
        if Promedio >= 6.0 {
            Status = true
        }else{
            Status = false
        }
    }
}
class Alumno {
    let numCuenta: Int
    init(numCuenta: Int){
        self.numCuenta = numCuenta
    }
}

class Ingeniero:Alumno,Evaluable{
    let Promedio: Float
    var Status: Bool = true
    init(numCuenta: Int,Promedio: Float) {
        self.Promedio = Promedio
        super.init(numCuenta: numCuenta)
        examinar(Status: &Status)
    }
    func examinar(Status: inout Bool) {
        decidir(Promedio: Promedio, Status: &Status)
    }
}

var Ing = Ingeniero(numCuenta: 12, Promedio: 5.0)
Ing.Status


//: [Next](@next)

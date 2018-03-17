//: [Previous](@previous)

import Foundation

class Alumno {
    var numCuenta: String
    fileprivate var nombre: String
    var edad: Int{
        willSet{
            print("Nuevo valor \(newValue)")
        }
        didSet{
            print("Valor actual \(oldValue)")
        }
    }
    init(numCuenta: String){
        self.numCuenta = numCuenta
        self.nombre = "Nobody"
        self.edad = 0
    }
    func metodoASobrecargar(){
        print("Hola soy una persona")
    }
}

class Ingeniero : Alumno{
    override func metodoASobrecargar() {
        print("Soy Ingeniero")
    }
}
class Contador : Alumno{
    override func metodoASobrecargar() {
        print("Soy Contador")
    }
}


let Edgar: Ingeniero = Ingeniero(numCuenta: "123456789")

Edgar.metodoASobrecargar()

//: [Next](@next)

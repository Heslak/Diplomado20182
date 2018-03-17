//: [Previous](@previous)

import Foundation

class Alumno{
    var numCuenta: String = ""
    init(numCuenta: String){
        self.numCuenta = numCuenta
    }
}

class Ingeniero: Alumno{
    
}

struct Profesor{
    var numEmpleo: String
}

var marduk =  Profesor(numEmpleo:"000000")
var parrita =  Alumno(numCuenta:"99999")
var german = parrita
german.numCuenta="1111111"
parrita.numCuenta

class Cartera{
    var dinero: Double
    var abonado: Double{
        get{
            print("Intereses \(dinero)")
            return dinero * 0.016
        }
        set{
            print("Se ha abonado: \(newValue)")
            dinero = (dinero * 0.16)+newValue
            print("Usted tiene \(dinero)")
        }
        
    }
    init(dinero: Double, abonado: Double){
        print("Creando una cartera con \(dinero)")
        self.dinero=dinero
        self.abonado=abonado
    }
    deinit{
        print("Destruyendo una cartera con \(dinero)")
    }
}

var cartera = Cartera(dinero: 23,abonado: 200)
cartera = Cartera(dinero: 233, abonado: 900)

print(cartera.abonado)
cartera.abonado = 10
print(cartera)

//: [Next](@next)

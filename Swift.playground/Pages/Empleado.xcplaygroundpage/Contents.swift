//: [Previous](@previous)

import Foundation


class Empleado {
    var sueldo : Double {
        willSet{
            if descuentos >= newValue {
                print("Me están dando muy poco sueldo \(sueldo)")
            }
        }
    }
    var descuentos : Double {
        willSet{
            if sueldo <= newValue {
                print("Me están descontando mucho")
            }
        }
    }
    let iva: Double = 0.16
    
    init(sueldo: Double, descuentos: Double ){
        self.descuentos = descuentos
        self.sueldo = sueldo*(1-iva)
    }
}

let Jorge =  Empleado(sueldo: 100.0,descuentos: 100.0)
Jorge.sueldo = 10
Jorge.descuentos = 0
//: [Next](@next)

//: [Previous](@previous)

import Foundation

var edad: Int = 19

switch edad {
    case 0...17:
        print("Muy chico")
    case 18:
        print("Exacto")
    default:
        print("Ya está acabado")
}

var animal: String = "gato"
switch animal{
    case "gato","perro":
        print("Animal doméstico")
    default:
        print("Ni idea")
}

var coordenadas3D: (x: Int, y:Int, z: Int) = (x: 3, y: 10, z: 30)
switch coordenadas3D {
    case (0, 0, 0):
        print("Origen")
    case (_, 0, 0):
        print("En X")
    case (0, let y, 0):
        print("En Y:\(y)")
    case (0, 0, _):
        print("En Z")
    default:
        break
}
//: [Next](@next)

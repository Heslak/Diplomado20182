//: [Previous](@previous)

import UIKit


enum Día {
    case Lunes
    case Martes
    case Miércoles
    case Jueves
    case Viernes
}

var díaSemana: Día
díaSemana = .Viernes


switch díaSemana {
    case .Lunes:
        print("Que hueva")
    case .Martes:
        print("Que flojera")
    case .Miércoles:
        print("Mitad de semana")
    case .Jueves:
        print("Ya casi fin de semana")
    case .Viernes:
        print("Adiós modo Godín")
}

enum EstadoDocumento :  Int {
    case Recibido = -1, Valido, EnProceso, Publicado
}

let valorEstado: Int = EstadoDocumento.Valido.rawValue
let estado = EstadoDocumento(rawValue : 90)
print(valorEstado)


enum ResultadoWebService{
    case Exito(String)
    case Error(Int)
}

func llamadaWS() -> ResultadoWebService {
    let exito=arc4random_uniform(UInt32(5))
    if exito == 1 {
        return ResultadoWebService.Exito("Mi contenido")
    }else{
        return ResultadoWebService.Error(502)
    }
}

let resultado : ResultadoWebService = llamadaWS()

switch resultado {
    case let .Exito(contenido):
        print(contenido)
    case let .Error(codigo):
        print("El código de error es \(codigo)")
}
//: [Next](@next)

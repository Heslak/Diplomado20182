//: [Previous](@previous)

import UIKit

protocol Vehiculo {
    var wheels: Int {
        get
    }
    func acelerar()
    func frenar()
}
protocol Tuning: Vehiculo {
    func rines (tipo: String)
}
protocol Pintura {
    var color: String {
        get
    }
    func colorear()
}
class Motito: Vehiculo, Pintura {
    var wheels: Int {
        get{
            return 2
        }
    }
    var color: String {
        get {
            return "Azul"
        }
    }
    func acelerar(){
        print("Acelera...")
    }
    func frenar(){
        print("...Frena")
    }
    func colorear(){
        print("Pintar")
    }
}

class RapidoyFurioso: Tuning{
    var wheels: Int {
        get {
            return 2
        }
    }
    func acelerar(){
        
    }
    func frenar(){
        
    }
    
    func rines (tipo: String){
        
    }
}
protocol Reflexion {
    var tipoReflexion: String {
        get
    }
}

extension String: Reflexion{
    var tipoReflexion: String {
        get{
            return "Muy pensativo el día de hoy"
        }
    }
}

let palabrita:String = "Hola"

palabrita.tipoReflexion
//: [Next](@next)

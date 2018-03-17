//: [Previous](@previous)

//: Playground - noun: a place where people can play

import UIKit
//: Tuplas
var tupla: (Int,Int) = (3,5)
print(tupla.0)
var tupla2 = (20,30)

var coordenadas: (x:Int, y:Int) = (x: 20,y:30)
coordenadas.x
let (x,y) = coordenadas

//: Rangos
var rangos = 0...10 //Llega hasta 10
var rangos2 = 0..<10 //Llegas hasta 9
var rangos3 = (0...10).reversed() //Del 10 al 0
var rangos4 = stride(from: 10, to: 100, by: 4) // del 10 al 100 de 4 en 4

//: While
var valor = 0
while valor < 10 {
    print(valor)
    valor += 1
}

repeat{
    print(valor)
    valor += 1
}while valor < 20

//: [Next](@next)

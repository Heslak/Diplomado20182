//: [Previous](@previous)

import Foundation


//: Closures

var miClosure:(Int, Int) -> Int
var miClosure2:(Int, Int) -> Int

miClosure = {(a:Int, b:Int) -> Int in
    return a+b
}
miClosure2 = {(a:Int, b:Int) -> Int in
    return a*b
}

print(miClosure(4,5))

func ejecutaOperacion( a:Int, b:Int,_ closure:(Int,Int)->Int){
    let resultado = closure(a,b)
    print(resultado)
}

ejecutaOperacion(a:10 ,b:19 , miClosure )
ejecutaOperacion(a:10 ,b:19 , miClosure2 )

miClosure = {(a,b) in
    a+b
}

ejecutaOperacion(a:10 ,b:19 , miClosure )

miClosure = {
    $0+$1
}

ejecutaOperacion(a:10 ,b:19 , miClosure )
ejecutaOperacion(a:10 ,b:19 , { $0 / $1 } )

var closureSinretorno: () -> Void = {
    print("No regresaré nada")
}


closureSinretorno()

var otroClosureSinretorno = { () -> Void in
    print("No regresaré nada")
}

var numero = 0

func incrementa(variable: inout Int){
    variable += 1
}

incrementa(variable: &numero)

let incrementaV2 = {
    numero += 1
}


incrementaV2()
incrementaV2()
incrementaV2()
incrementaV2()
incrementaV2()
incrementaV2()

print(numero)

func incrementaClosure() -> () -> Int {
    var contador = 0
    let incrementa : () -> Int = {
        contador += 1
        return contador
    }
    return incrementa
}

let contador1 =  incrementaClosure()
let contador2 =  incrementaClosure()

contador1()
contador1()
contador2()
contador1()

let letras = ["Z","CCCCCCCC","MHHHHH","OOOOOOO","Hiiiii"]

print(letras)
print(letras.sorted())

print (letras.sorted{
    $0.count < $1.count
})

letras.forEach{ (String) in
    print(String)
}


let numeros = [2.3,3.1,4.7,5.2,7.8,9.1,10]

numeros.forEach{
    print($0)
}


let filtrados = numeros.filter{
    return $0 > 5
}
print("Numeros filtrados: \(filtrados)")

let mapeados = numeros.map{
    return $0 * 10
}
print("Mapeados: \(mapeados)")

let letrasNumeros = ["Hola","0","adios","1","3"]

let numerosUsuario = letrasNumeros.flatMap{
    Int($0)
}

print(numerosUsuario)


let total = numeros.reduce(0){
    return $0 + $1
}
print(total)


//: [Next](@next)

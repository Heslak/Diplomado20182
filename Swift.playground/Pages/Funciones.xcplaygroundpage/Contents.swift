//: [Previous](@previous)

import Foundation

func funcion(valor: Int){
    print(valor)
}

funcion(valor: 10)


func FuncionSinNombrarParametro(_ valor: Int){
    print(valor)
}

FuncionSinNombrarParametro(20)

func RenombrarParametros( OtroNombre valor :Int ){
    print(valor)
}

RenombrarParametros(OtroNombre: 30)

func Multiplica (_ x:Int, por y:Int) -> Int{
    return x*y
}

print(Multiplica (5,por: 10))

func Divide (_ x:Int, entre y:Int) -> (resultado: Int, residuo: Int){
    return (x/y,x%y)
}
let resultado: (resultado:Int, residuo:Int) = Divide(5, entre:4)

print(resultado.residuo)
print(resultado.resultado)

//: Apuntadores
func Suma(_ a: inout Int){
    a += 1
    print(a)
}

var numero = 4
Suma(&numero)
print(numero)


//: Overloading, Sobre carga de métodos, Poliformismo
func getValue(_ x:Int) -> Int {
    return 20
}

func getValue(_ s:String) -> String {
    return "Hola"
}

var x: Int = getValue(1)
var s: String = getValue("Gato")


//func PaisdelNunca() -> Never {
//    print("Never")
//}

//PaisdelNunca()

//: [Next](@next)

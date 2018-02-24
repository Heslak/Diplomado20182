//: Playground - noun: a place where people can play

import UIKit


//: Let y var
//: Let es más rápido, var tienes que hacer esperar ciclos de relojs para ir por el valor de la variable
//: Tipos de variables
//: String
//: Int
//: Float
//: Double
//: Boolean
//: Adios a variables primitivas, ya todo son clases
//: Condiciones
//: IF, ELSE IS, ELSE
//: Bien: a+b ó a + b
//: Mal: a +b

func factorial( n: Int ) -> Int{
    var x: Int = n
    if n==1 {
        return 1
    }
    x = x * factorial(n:x-1 )
    return x
}

func fibonacci( n: Int ) -> Int{
    var x: Int = n
    if n==1 {
        return 1
    }
    x = x + fibonacci(n:x-1 )
    return x
}

print(factorial(n: 20))
	
print(fibonacci(n: 3))

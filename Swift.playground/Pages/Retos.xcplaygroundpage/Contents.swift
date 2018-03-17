//: [Previous](@previous)

import Foundation

func Primo(numero: Int) -> Bool{
    if numero <= 1{
        return false
    }
    for i in 2..<numero{
        if numero%i == 0{
            return false
        }
    }
    return true
}

func Fibonacci(lim: Int) {
    var i: Int = 0
    var n: Int = 0
    var temp: Int = 1
    var temp_ant: Int = 0
    while n <= lim {
        if Primo(numero: i){
            print(i)
            n += 1
        }
        i=temp_ant+temp
        temp_ant=temp
        temp=i
    }
}

Fibonacci(lim: 7)

func Palindromo(palindromo: String) -> String{
    if String(palindromo.reversed()) == palindromo {
        return "Es un palindromo"
    }
    return "No es un palindromo"
}

print(Palindromo(palindromo: "anitalavalatin"))


func Anagrama(comparador: String, comparado: String) -> String{
    if comparador.count != comparado.count {
        return "No es un anagrama"
    }
    for i in comparado{
        if !comparador.contains(i) {
            return "No es un anagrama"
        }
    }
    return "Si es un anagrama"
}

print(Anagrama(comparador: "OMRO", comparado: "ROMA"))



//: [Next](@next)

//: [Previous](@previous)

import Foundation


//sleep
func arma(){
    var escudo : Int = 10
    var conteoBalasDisparadas: Int = 0
    let armaSobrecalentada: Int = 200
    
    while escudo > 0 {
        if conteoBalasDisparadas == armaSobrecalentada {
            print("Arma sobrecalentada")
            sleep(1)
            conteoBalasDisparadas = 0
            escudo -= 1
        }
        conteoBalasDisparadas += 1
    }
    print("Game Over")
}


arma( )
//: [Next](@next)

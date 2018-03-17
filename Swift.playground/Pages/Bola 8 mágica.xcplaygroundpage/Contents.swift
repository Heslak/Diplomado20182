//: [Previous](@previous)

import Foundation

func magicEightBall(){
    let randomNum=arc4random_uniform(UInt32(5))
    
    switch randomNum {
    case 0:
        print("Yes")
    case 1:
        print("No")
    case 2:
        print("Maybe")
    case 3:
        print("Good look next time")
    case 4:
        print("Try it later")
    default:
        break
    }
}


magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()
magicEightBall()



//: [Next](@next)

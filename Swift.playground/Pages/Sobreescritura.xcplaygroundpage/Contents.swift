//: [Previous](@previous)

import UIKit

extension Array{
    subscript(safe idx: Int) -> Element?{
        return idx < endIndex ? self [idx] : nil
    }
}

precedencegroup ExponentiationPrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiationPrecedence


func ** (lhs: Decimal, rhs: Int) -> Decimal{
    return pow(lhs,rhs)
}

var x = 4**2

extension Sequence where Element: Equatable{
    func isSubset(of other: [Element]) -> Bool {
        for element in self {
            guard other.contains(element) else {
                return false
            }
        }
        return true
    }
}

let unoatres = [1,2,3]
let cincoauno = [5,4,3,2,1]

unoatres.isSubset(of: cincoauno)

//: [Next](@next)

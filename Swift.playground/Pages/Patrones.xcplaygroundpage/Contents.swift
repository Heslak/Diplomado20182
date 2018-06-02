//: [Previous](@previous)

import Foundation

protocol Taco {
    var costo: Double{ get }
    var descripcion: String { get }
    
}

class TacoDeCarnitas: Taco{
    var costo: Double{
        get{
            return 30.0
        }
    }
    
    var descripcion: String{
        get{
            return "Taco de carnitas"
        }
    }
}

class TaciDecorator: Taco{
    let tacoInstance:Taco
    
    var costo: Double{
        get{
            return tacoInstance.costo
        }
    }
    
    var descripcion: String{
        get{
            return tacoInstance.descripcion
        }
    }
    required init(taco: Taco) {
        self.tacoInstance = taco
    }
}

class Cilantro: TaciDecorator{
    override var costo: Double{
        get{
            return tacoInstance.costo + 20
        }
    }
    
    override var descripcion: String{
        get{
            return tacoInstance.descripcion + ", con cilantro"
        }
    }
    
    required init(taco: Taco) {
        super.init(taco: taco)
    }
    
}

class Aguacate: TaciDecorator{
    override var costo: Double{
        get{
            return tacoInstance.costo + 20
        }
    }
    
    override var descripcion: String{
        get{
            return tacoInstance.descripcion + ", con aguacate"
        }
    }
    required init(taco: Taco) {
        super.init(taco: taco)
    }
}

func main(){
    var tacoDeCarnitas: Taco = TacoDeCarnitas()

    tacoDeCarnitas = Cilantro(taco: tacoDeCarnitas)
    tacoDeCarnitas = Aguacate(taco: tacoDeCarnitas)
        
    print("Comere \(tacoDeCarnitas.descripcion)")
    

    
}
main()
//: [Next](@next)

//: [Previous](@previous)

import UIKit

/*let fileManager = FileManager.default
let documentDirectories = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
let documentDirectory = documentDirectories.first!
*/


//: Datos Binarios
//init(contentsOf url: URL, options: Data.ReadingOptions) throws

//func write(to url: URL, options: Data.WritingOptions) throw

//: Archivos String

//init (contentsOf: url, enconding enc: String.Enconding) throw

//func write(to url: URL, atomically useAuxiliaryFile: Bool, encoding enc: String.Encoding) throw

//: Archivos tipo estructura
//: Con NSCoding es un protocolo

/*protocol NSCoding{
    init?(coder aDecoder: NSCoding){
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    
    func encode(with: aCoder: NSCoder){
    }
}*/


//: [Next](@next)

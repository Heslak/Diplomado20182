//
//  ImageManager.swift
//  LocalSettings
//
//  Created by Luis Ezcurdia on 4/13/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    static let shared = ImageManager()

    func download(url: URL, completion: @escaping ((UIImage) -> Void)) {
        print("Downloaing image...")
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else { return }
                print("[Complete]")
                DispatchQueue.main.async { completion(image) }
            } catch let err {
                print("ERROR while downloading image: \(err)")
                return
            }
        }
    }
}

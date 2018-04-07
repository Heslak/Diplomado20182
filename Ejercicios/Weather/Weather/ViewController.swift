//
//  ViewController.swift
//  Weather
//
//  Created by d182_Sergio_A on 03/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:"http://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&APPID=988ae77b02395c48d328271839ad81ac")
        let task = URLSession.shared.dataTask(with: url!, completionHandler:{ (data,respone,error) in
            if data != nil {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    DispatchQueue.main.async {
                        if let main = json!["main"] as! [String: Any]? {
                            self.temperatureLabel.text = "\(main["temp"] as! Float)º C"
                        }
                        self.locationLabel.text =  json!["name"] as? String
                    }
                }catch let e {
                    print("Error retrieving weather data:\(e)")
                }
            }
        })
        
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("didReceiveMemoryWarning")
    }


}


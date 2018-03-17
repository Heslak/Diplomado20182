//
//  MainTabViewController.swift
//  Automotion
//
//  Created by d182_Sergio_A on 16/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        unwrappingItems()
        // Do any additional setup after loading the view.
    }

    func unwrappingItems () {
        guard let unwrappedItems : [UITabBarItem] = self.tabBar.items else { return }
        for item in unwrappedItems{
            let setup = itemSetup(item)
            item.badgeValue = setup.0
            item.isEnabled = setup.1
        }
    }
    private func itemSetup(_ item: UITabBarItem) -> (String?,Bool){
        guard let unwrappedItemTitle = item.title else { return (nil,false) }
        debugPrint(unwrappedItemTitle)
        switch unwrappedItemTitle {
            case "Sales":
                return("100",true)
            case "Inspection":
                return(nil,false)
            default:
                return(nil,true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

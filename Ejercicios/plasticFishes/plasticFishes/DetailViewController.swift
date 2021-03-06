//
//  DetailViewController.swift
//  plasticFishes
//
//  Created by d182_Sergio_A on 06/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var nameDescriptionLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.text
            }
            if let name = nameDescriptionLabel {
                name.text = detail.name
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Fish? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}


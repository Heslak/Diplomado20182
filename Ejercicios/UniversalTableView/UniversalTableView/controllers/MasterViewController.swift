//
//  MasterViewController.swift
//  UniversalTableView
//
//  Created by d182_Sergio_A on 17/03/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit
typealias UserResponse  = ([User]) -> Void
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var users = [User](){
        didSet{
            updateData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadUserService { users in
            self.users = users
        }

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(users[(objects.count)%users.count], at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! User
        cell.textLabel!.text = object.fullName
        cell.detailTextLabel?.text = object.email
        cell.imageView?.image = object.image
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func loadUserService(completion: UserResponse){
        completion(loadUsers())
    }
    func loadUsers() -> [User] {
        return[
            User(firstName: "Pepe", lastName: "Guayabas", email: "pepe@guayabas.com",citizenship: "Mexican",gender: false),
            User(firstName: "Bannana", lastName: "Joe", email: "bannana.hoe@gmail.com",citizenship: "Mexican", gender: true),
            User(firstName: nil, lastName: nil, email: "test@example.com",citizenship: "Mexican", gender: true),
            User(firstName: "Julio", lastName: nil, email: "julio@lacomer.com",citizenship: "Mexican", gender: false),
            User(firstName: nil, lastName: "Wayne", email: "wayne@industries.com",citizenship: "Mexican", gender: true)
        ]
    }
    
    func updateData(){
        self.tableView.reloadData()
    }



}


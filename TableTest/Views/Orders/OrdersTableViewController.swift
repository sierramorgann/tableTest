//
//  AppLandingPageViewController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/17/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit
import CoreData
import Cadmium

class OrdersTableViewController : SlideViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBAction func addButtonPressed(_ sender: Any) {
        
        
    }
    
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpTable()
        
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        }
    
        func setUpTable() {
            self.tableView.register(UINib(nibName: "OrdersCellViewController", bundle: nil), forCellReuseIdentifier: "orders")
            
            self.tableView.dataSource = self
            
            self.tableView.delegate = self as? UITableViewDelegate
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureCell(_ cell:OrdersCellViewController, orders:Orders)
    {
        cell.titleLabel.text = orders.title
        
        if orders ==
    }
}

//extension OrdersTableViewController : UITabBarDelegate {
//
//}

extension OrdersTableViewController : UITableViewDataSource {
    
    //return the number of rows in the table based off data
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    //dequeues table view cells and populates them with the corresponding string from the names array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
}


//
//  AppLandingPageViewController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/17/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit
import CoreData

class AppLandingPageViewController : SlideViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpTable()
        }
    
        func setUpTable() {
            self.tableView.register(UINib(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "project")
            
            self.tableView.dataSource = self
            
            self.tableView.delegate = self as? UITableViewDelegate
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AppLandingPageViewController : UITabBarDelegate {
    
}

extension AppLandingPageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "Cell",
                                              for: indexPath)
            cell.textLabel?.text = names[indexPath.row]
            return cell
    }
}


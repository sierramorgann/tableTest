//
//  AppLandingPageViewController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/17/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit

class AppLandingPageViewController : SlideViewController {
    
    @IBOutlet var homeScreenTable: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBAction func addButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpTable()
        }
    
        func setUpTable() {
            
        }
}


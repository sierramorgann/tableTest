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
    @IBOutlet var editButton:UIBarButtonItem!
    @IBOutlet var tableView:UITableView!
    
    var results:NSFetchedResultsController<Cadmium.CdManagedObject>?
    var lastSelectedIndexPath:IndexPath?
    
    //all methods that would cause navigation to change, so that flowController can hook into them
    public var addOrderBlock: (() -> Void)?
    public var enterOrderBlock: (() -> Void)?
    
    
    @IBAction func addPressed(_ sender: Any)
    {
        if let addOrder = addOrderBlock
        {
            addOrder()
        }
    }
    
    @IBAction func editButtonPressed() {
        
       toggleEditingMode()
    }
    
    func toggleEditingMode()
    {
        self.tableView.isEditing = !self.tableView.isEditing
        
        if self.tableView.isEditing
        {
            editButton.title = "Done"
            
        } else {
            editButton.title = "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        results = InventoryDataStore.sharedInstance.allInventoryController()
//        results?.delegate = self
        
        do {
            try results?.performFetch()
        } catch let error
        {
            NSLog("error getting results delegate fetch:\(error)")
        }
        
        setUpTable()
        
        }
    
        func setUpTable() {
            self.tableView.register(UINib(nibName: "OrdersCellViewController", bundle: nil), forCellReuseIdentifier: "orders")
            
            self.tableView.dataSource = self
            
            self.tableView.delegate = self as? UITableViewDelegate
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureCell(_ cell:OrdersCellViewController, orders:Order)
    {
        cell.titleLabel.text = orders.title
        
        if orders == InventoryState.sharedInstance.retrieveActiveOrder()
        {
            //it's possible the cell wasn't selected properly -- ensure its selection
            if let selectedPath = self.results?.indexPath(forObject: orders as Cadmium.CdManagedObject)
            {
                self.tableView.selectRow(at: selectedPath, animated: false, scrollPosition: .none)
            }
        } else {
            cell.isSelected = false
        }
    }
}

extension OrdersTableViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            //deleteOrderWithCell(indexPath:indexPath)
        }
    }
}

extension OrdersTableViewController : NSFetchedResultsControllerDelegate
{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: .left)
            break
            
        case .insert:
            self.tableView.insertRows(at: [newIndexPath!], with: .right)
            break
            
        case .move:
            self.tableView.moveRow(at: indexPath!, to: newIndexPath!)
            
            break
            
        case .update:
            self.tableView.reloadRows(at: [indexPath!], with: .none)
            break
            
        }
    }
}




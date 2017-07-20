//
//  InventoryDataStore.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/20/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import Foundation
import Cadmium
import CoreData

class InventoryDataStore {
    
    static let sharedInstance = InventoryDataStore()
    let sqliteDatabaseName = "inventory"
    let momdName = "InventoryModel.momd"
    
    lazy var sqliteFileURL:URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory   = documentDirectories[documentDirectories.count - 1]
        let sqliteURL           = documentDirectory.appendingPathComponent(self.sqliteDatabaseName)
        
        return sqliteURL
    }()
    
    init()
    {
        do {
            try Cd.initWithSQLStore(momdInbundleID: nil, momdName: momdName, sqliteFilename: sqliteDatabaseName, options: nil)
        } catch let error {
            let fm = FileManager()
            if fm.fileExists(atPath: self.sqliteFileURL.path)
            {
                do {
                    try fm.removeItem(at: self.sqliteFileURL)
                    try Cd.initWithSQLStore(momdInbundleID: nil, momdName: momdName, sqliteFilename: sqliteDatabaseName, options: nil)
                    
                    print("Successfulyl recovered from error by deleting existing sqlite database. Error:\n \(error)")
                    
                } catch let e {
                    print("Failed twice to initialize SQLite even after deleting databse. \(e)")
                }
            }
        }
    }

    //controllers
    func allInventoryController() -> NSFetchedResultsController<Cadmium.CdManagedObject>
    {
        return Cd.newFetchedResultsController(self.allOrdersRequest(), sectionNameKeyPath: nil, cacheName: nil)
    }
    func InventoryForOrdersIdController(_ orderID:Int16) -> NSFetchedResultsController<Cadmium.CdManagedObject>
    {
        return Cd.newFetchedResultsController(self.InventoryRequest(orderID), sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func allObjectsController() -> NSFetchedResultsController<Cadmium.CdManagedObject>
    {
        return Cd.newFetchedResultsController(self.allInventoryRequest(), sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func ObjectsContainingText(_ text:String) -> NSFetchedResultsController<Cadmium.CdManagedObject>
    {
        return Cd.newFetchedResultsController(self.InventoryContainingText(text), sectionNameKeyPath: nil, cacheName: nil)
    }
    
    //requests
    func allOrdersRequest() -> NSFetchRequest<Cadmium.CdManagedObject>
    {
        let request = NSFetchRequest<Cadmium.CdManagedObject>(entityName: "Order")
        
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        return request
    }
    
    func InventoryContainingText(_ text:String) -> NSFetchRequest<Cadmium.CdManagedObject>
    {
        let request = NSFetchRequest<Cadmium.CdManagedObject>(entityName: "Product")
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let predicate = NSPredicate(format: "fullname CONTAINS [c] %@", text)
        request.predicate = predicate
        
        return request
    }
    
    func InventoryRequest(_ orderID:Int16) -> NSFetchRequest<Cadmium.CdManagedObject>
    {
        let request = NSFetchRequest<Cadmium.CdManagedObject>(entityName: "Product")
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let predicate = NSPredicate(format: "parentOrder.identifier == %@", orderID)
        request.predicate = predicate
        
        return request
    }
    
    func allInventoryRequest() -> NSFetchRequest<Cadmium.CdManagedObject>
    {
        let request = NSFetchRequest<Cadmium.CdManagedObject>(entityName: "Product")
        request.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        return request
    }
}


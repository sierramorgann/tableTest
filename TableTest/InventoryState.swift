//
//  InventoryState.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/20/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit
import Cadmium

//This class will handle the inbetween conversation between data and UI interface

class InventoryState : NSObject {
    //recursion to call class
    static let sharedInstance = InventoryState()
    
    // set up variables to declare when a viewController is active i.e. is showing
    var activeOrdersIdentifier: String?
    var activeInventoryIdentifier: String?
    
    //call this instead of setting activeProject
    //It will handle auxiliary changes such as restoration information
    func configureNewActiveOrder(_ o: Order?) {
        
        print("CONFIGURE NEW ACTIVE ORDER")
        //if has VC show it and set to Active else return nil
        if let order = o
        {
            //resets activeOrdersIdentifier to new orders.identifier i.e. when moving to new VC update the activeOrdersIdentifier
            activeOrdersIdentifier = order.identifier
            
            let defaults = UserDefaults.standard
            defaults.set(activeOrdersIdentifier, forKey: "order")
            defaults.synchronize()
        } else {
            activeOrdersIdentifier = nil
        }
    }
    
    func loadActiveOrdersFromDefaults()
    {
        let defaults = UserDefaults.standard
        if let identifier = defaults.string(forKey: "order")
        {
            if let order = retrieveOrders(identifier as NSString)
            {
                configureNewActiveOrders(order)
            }
        }
    }
    
    func configureNewActiveInvetory(_ i:Inventory?)
    {
        activeInventoryIdentifier = i?.identifier
    }
    
    func retrieveActiveOrder() -> Order?
    {
        if let identifier = activeOrdersIdentifier
        {
            return retrieveProject(identifier as NSString)
        }
        return nil
    }
}

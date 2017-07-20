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

class ProductState : NSObject {
    //recursion to call class
    static let sharedInstance = ProductState()
    
    // set up variables to declare when a viewController is active i.e. is showing
    var activeOrdersIdentifier: String?
    var activeProductIdentifier: String?
    
    //call this instead of setting activeOrder
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
            if let order = retrieveOrder(identifier as NSString)
            {
                configureNewActiveOrder(order)
            }
        }
    }
    
    func configureNewActiveInvetory(_ p:Product?)
    {
        activeProductIdentifier = p?.identifier
    }
    
    func retrieveActiveOrder() -> Order?
    {
        if let identifier = activeOrdersIdentifier
        {
            return retrieveOrder(identifier as NSString)
        }
        return nil
    }
    
    func retrieveOrder(_ identifier:NSString) -> OrderObj?
    {
        do {
            if let order = try Cd.objectWithID(OrderObj.self, idValue: identifier, key: "identifier")
            {
                return order
            }
        } catch let error {
            print("couldn't retrieve order with identifier (\(identifier)) error:\(error)")
        }
        return nil
    }
    
    func retrieveProduct(_ identifier:NSString) -> ProductObj?
    {
        do {
            if let product = try Cd.objectWithID(ProductObj.self, idValue: identifier, key: "identifier")
            {
                return product
            }
        } catch let error {
            print("couldn't retrieve active product with identifier (\(identifier)) error:\(error)")
        }
        return nil
    }
}

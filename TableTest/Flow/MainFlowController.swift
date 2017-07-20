//
//  MainFlowController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/17/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit

protocol Slide
{
    var didCompleteAction:(() -> Void)? {get set}
}

class ScreenFactory {
    
    //creates the View Controller when it needs to be loaded by the navigation controller
    
    public func GetScreenViewController(screen:ScreenControllerNibNames) -> StyledViewController
    {
        //sets targetClass as the requested ViewController
        let targetClass = DefaultScreenNibToClassAssociations[screen]! as UIViewController.Type
        let nibName = screen.rawValue
        
        return targetClass.init(nibName: nibName, bundle: nil) as! StyledViewController
    }
    
    
}

class FlowController {
    let navigationController: UINavigationController
    let screenFactory:ScreenFactory
    
    init(_ nav:UINavigationController, factory:ScreenFactory)
    {
        navigationController = nav
        screenFactory = factory
    }
    
    public func startFlow()
    {
        
    }
    
    public func finishFlow()
    {
        self.navigationController.popToRootViewController(animated: true)
    }
    
}

protocol FlowControllerDelegate {
    //this is just telling the flow controller what to expect
    func didFinishFlow(flow:FlowController) -> Void
}

/*
 
Supported Flows:
 
OrdersFlow
 1. Orders Table
 2. Add Order
 3. Overview Order
 
InventoryFlow
 1. Orders Table
 2. Inventory Table
 3. Add Inventory
 4. Inventory Overview
 5. Profit Overview
 
 */

class MainFlowController
{
    let navigationController:UINavigationController
    let ordersController:OrdersTableViewController
    
    let ordersFlow:OrdersFlowController
    let inventoryFlow:InventoryFlowController
    
    let screenFactory:ScreenFactory = ScreenFactory()
    
    init(_ nav:UINavigationController, orders:OrdersTableViewController){
//        navigationController = nav
//        ordersController = orders
    }
}

enum ScreenControllerNibNames : String
{
    case OrdersTableViewController
    case AddOrderViewController
    case OrdersViewController
    case InventoryTableViewController
    case AddInventoryViewController
    case InventoryViewController
    case ProfitViewController
    
}

let DefaultScreenNibToClassAssociations:Dictionary<ScreenControllerNibNames,StyledViewController.Type> =
    [
        ScreenControllerNibNames.OrdersTableViewController : OrdersTableViewController.self,
        ScreenControllerNibNames.AddOrderViewController : AddOrderViewController.self,
        ScreenControllerNibNames.OrdersViewController : OrdersViewController.self,
        ScreenControllerNibNames.InventoryTableViewController : InventoryTableViewController.self,
        ScreenControllerNibNames.AddInventoryViewController : AddInventoryViewController.self,
        ScreenControllerNibNames.InventoryViewController : InventoryViewController.self,
        ScreenControllerNibNames.ProfitViewController : ProfitViewController.self
        
]









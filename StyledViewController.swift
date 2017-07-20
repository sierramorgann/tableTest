//
//  StyledViewController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/18/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit

class StyledViewController : UIViewController {
    public var didCompleteAction:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBackButtonTitle(_ title:String)
    {
        self.navigationController!.navigationBar.topItem!.title = title
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //  self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
    }
    
    func styleComponents()
    {
        if let navbar = self.navigationController?.navigationBar
        {
            navbar.shadowImage = UIImage()
            navbar.setBackgroundImage(UIImage(), for: .default)
            navbar.backgroundColor = UIColor.black
            navbar.tintColor = UIColor.white
            navbar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
            
        }
    }
}


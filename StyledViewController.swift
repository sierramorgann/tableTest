//
//  StyledViewController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/18/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit

class StyledViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//ios 10 and below only; change navigation bar height
extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let screenRect = UIScreen.main.bounds
        return CGSize(width: screenRect.size.width, height: 70)
    }
}

//
//  MainFlowController.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/17/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import Foundation
import UIKit

class MainFlowController {
    let navigationController: UINavigationController
    let appLandingPageController: AppLandingPageViewController
    
    init(_ nav:UINavigationController, appLanding:AppLandingPageViewController)
    {
        navigationController = nav
        appLandingPageController = appLanding
        
    }
    
}

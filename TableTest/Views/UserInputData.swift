//
//  UserInputData.swift
//  TableTest
//
//  Created by Sierra Morgan on 7/18/17.
//  Copyright © 2017 Sierra Morgan. All rights reserved.
//

import UIKit

class UserData {
    
    var name: String
    var logo: UIImage?
    var shirtSize: String
    var phoneNumber: Int
    var email: String?
    var pricePaid: Int
    
    init?(name: String, logo: UIImage?, shirtSize: String, phoneNumber: Int, email: String?, pricePaid: Int) {
        
        self.name = name
        self.logo = logo
        self.shirtSize = shirtSize
        self.phoneNumber = phoneNumber
        self.pricePaid = pricePaid
        self.email = email
        
        if name.isEmpty || shirtSize.isEmpty || phoneNumber < 0 || pricePaid < 0  {
            return nil
        }
    }
    
}

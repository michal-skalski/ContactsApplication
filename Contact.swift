//
//  Contact.swift
//  Contacts
//
//  Created by Michał Skalski on 17.01.2017.
//  Copyright © 2017 Michał Skalski. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    let name: String
    let image: UIImage?
    let phoneNum: String?
    let email: String?
    
    init(name: String, image: UIImage?, phoneNum: String?, email: String?) {
        self.name = name
        self.image = image
        self.phoneNum = phoneNum
        self.email = email
    }
}

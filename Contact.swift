//
//  Contact.swift
//  Contacts
//
//  Created by Michał Skalski on 17.01.2017.
//  Copyright © 2017 Michał Skalski. All rights reserved.
//

import Foundation
import UIKit

class Contact: NSObject, NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let imageKey = "image"
        static let phoneNumKey = "phoneNum"
        static let emailKey = "email"
    }
    
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
    
    // NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(image, forKey: PropertyKey.imageKey)
        aCoder.encode(phoneNum, forKey: PropertyKey.phoneNumKey)
        aCoder.encode(email, forKey: PropertyKey.emailKey)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let image = aDecoder.decodeObject(forKey: PropertyKey.imageKey) as? UIImage
        let phoneNum = aDecoder.decodeObject(forKey: PropertyKey.phoneNumKey) as? String
        let email = aDecoder.decodeObject(forKey: PropertyKey.emailKey) as? String
        
        self.init(name: name, image: image, phoneNum: phoneNum, email: email)
        
    }
}

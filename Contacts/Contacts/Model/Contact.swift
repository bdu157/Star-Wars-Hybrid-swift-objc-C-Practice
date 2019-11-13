//
//  Contact.swift
//  Contacts
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

@objc(LSIContact)
class Contact: NSObject {
    var name: String
    var relationship: String?
    
    @objc init(name:String, relationship: String?) {
        self.name = name
        self.relationship = relationship
    }
}

//
//  DataService.swift
//  Contactless
//
//  Created by Vardhan Agrawal on 8/11/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit
import Firebase

let databaseReference = Database.database().reference()

class DataService {
    
    static let shared = DataService()
    
    private var _REF_CONTACTS = databaseReference.child("contacts")
    
    var REF_CONTACTS: DatabaseReference { return _REF_CONTACTS }
}

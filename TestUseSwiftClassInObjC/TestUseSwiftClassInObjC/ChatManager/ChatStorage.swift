//
//  AppDelegate.swift
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

import UIKit
import Quickblox

class ChatStorage {
    //MARK: - Properties
    var users: [User] = []
    
    //MARK: - Internal Methods
    func clear() {
        self.users = []
    }
    
    func update(users: [QBUUser]) {
        for chatUser in users {
            update(user:chatUser)
        }
    }
    
    func update(user: QBUUser) {
        users.append(User(user: user))
    }
}

//
//  AppDelegate.swift
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

import Foundation
import Quickblox

class User {
    //MARK - Properties

    var ID: UInt = 0
    
    var login: String = ""
    
    var fullName: String = ""
    
    //MARK: - Life Cycle
    required init(user: QBUUser) {
        self.ID = user.id
        self.login = user.login ?? ""
        self.fullName = user.fullName ?? ""
    }
    
    func convertToDictionary() -> [String: String] {
        var dictionary: [String: String] = [:]
        dictionary["ID"] = "\(ID)"
        dictionary["login"] = login
        dictionary["fullName"] = fullName
        return dictionary
    }
}

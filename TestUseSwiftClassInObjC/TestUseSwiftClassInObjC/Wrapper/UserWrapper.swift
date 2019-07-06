//
//  AppDelegate.swift
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

import UIKit
import Quickblox

@objc(User)
class UserWrapper: NSObject {
    
    private let user: User!

    //MARK: - Life Cycle
    required init(user: User) {
        self.user = user
    }
    
  @objc public func convertToDictionary() -> [String: String] {
       return user.convertToDictionary()
    }
}

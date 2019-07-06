//
//  AppDelegate.swift
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

import UIKit
import Quickblox

struct CredentialsConstant {
    static let applicationID:UInt = 77671
    static let authKey = "grskQDACQs8vtcv"
    static let authSecret = "YKpSnxUNzqq4vHL"
    static let accountKey = "WhsXjwx1eyCxAYUE4hUg"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window?.backgroundColor = .white;
        // Set QuickBlox credentials (You must create application in admin.quickblox.com).
        QBSettings.applicationID = CredentialsConstant.applicationID
        QBSettings.authKey = CredentialsConstant.authKey
        QBSettings.authSecret = CredentialsConstant.authSecret
        QBSettings.accountKey = CredentialsConstant.accountKey
        // enabling carbons for chat
        QBSettings.carbonsEnabled = true
        // Enables Quickblox REST API calls debug console output.
        QBSettings.logLevel = .debug
        // Enables detailed XMPP logging in console output.
        QBSettings.enableXMPPLogging()
        
        return true
    }
}

//
//  AppDelegate.swift
//  TestUseSwiftClassInObjC
//
//  Created by Vladimir Nybozhinsky on 7/6/19.
//  Copyright © 2019 skylife. All rights reserved.
//

import UIKit
import Quickblox

struct ChatManagerConstant {
    static let chatServiceDomain = "com.q-municate.chatservice"
    static let errorDomaimCode = -1000
}

typealias UsersIterationHandler = (_ response: QBResponse?, _ objects: [QBUUser]?, _ stop: Bool?) -> Void
typealias UsersPage = (_ page: QBGeneralResponsePage) -> Void

class ChatManager {
    
    //MARK: - Properties
    var storage = ChatStorage()
    
    //MARK: - Life Cycle
    //Shared Instance
    static let instance: ChatManager = {
        let instance = ChatManager()
        return instance
    }()
    
    //MARK: - Public Methods
    
    
    //MARK: - Connect/Disconnect
    func connect(completion: QBChatCompletionBlock? = nil) {
        let currentUser = Profile()
        
        guard currentUser.isFull == true else {
            completion?(NSError(domain: ChatManagerConstant.chatServiceDomain,
                                code: ChatManagerConstant.errorDomaimCode,
                                userInfo: [
                                    NSLocalizedDescriptionKey: "Please enter your login and username."
                ]))
            return
        }
        if QBChat.instance.isConnected == true {
            completion?(nil)
        } else {
            QBSettings.autoReconnectEnabled = true
            QBChat.instance.connect(withUserID: currentUser.ID,
                                    password: currentUser.password,
                                    completion: completion)
        }
    }
    
    func disconnect(completion: QBChatCompletionBlock? = nil) {
        if QBChat.instance.isConnected == true {
            QBChat.instance.disconnect(completionBlock: completion)
        } else {
            completion?(nil)
        }
    }

    //MARK: - Users
     func updateUsers(completion: @escaping (_ response: QBResponse?) -> Void) {
        let firstPage = QBGeneralResponsePage(currentPage: 1, perPage: 100)
        QBRequest.users(withExtendedRequest: ["order": "desc string updated_at"],
                        page: firstPage,
                        successBlock: { (response, page, users) in
                            self.storage.update(users:users)
                            completion(response)
        }, errorBlock: { response in
            completion(response)
        })
    }
    
    func color(_ index: Int) -> UIColor {
        let colors = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3035047352, green: 0.8693258762, blue: 0.4432001114, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.02297698334, green: 0.6430568099, blue: 0.603818357, alpha: 1), #colorLiteral(red: 0.5244195461, green: 0.3333674073, blue: 0.9113605022, alpha: 1), #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1), #colorLiteral(red: 0.839125216, green: 0.871129334, blue: 0.3547145724, alpha: 1), #colorLiteral(red: 0.09088832885, green: 0.7803853154, blue: 0.8577881455, alpha: 1), #colorLiteral(red: 1, green: 0.3950406728, blue: 0.0543332563, alpha: 1), #colorLiteral(red: 1, green: 0.5161726656, blue: 0.9950085603, alpha: 1), #colorLiteral(red: 1, green: 0.01143101626, blue: 0.09927682555, alpha: 1)]
        if index >= 0 {
            return colors[index % 10]
        } else {
            return .black
        }
    }
    
}

//
//  DialogModel.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import Foundation
class DialogModel
{
    var name: String
    var message: String?
    var date: Date
    var online: Bool
    var hasUnreadMessages: Bool?
    
    init(name: String, message: String?, date: Date, online: Bool, hasUnread: Bool)
    {
        self.name = name
        self.message = message
        self.date = date
        self.online = online
        self.hasUnreadMessages = hasUnread
    }
}

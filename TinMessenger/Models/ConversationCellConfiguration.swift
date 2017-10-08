//
//  ConversationCellConfiguration.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import Foundation

protocol ConversationCellConfiguration : class
{
    var name : String? {get set}
    var message : String? {get set}
    var date : Date? {get set}
    var online : Bool {get set}
    var hasUnreadMessages : Bool {get set}
}

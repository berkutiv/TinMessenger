//
//  ConversationTableViewCell.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell, ConversationCellConfiguration
{
    var name: String?
    var message: String?
    var date: Date?
    var online: Bool = false
    var hasUnreadMessages: Bool = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configureSelf(name : String, message : String?, date : Date, isOnline : Bool, hasUnread : Bool)
    {
        self.name = name
        self.message = message
        self.date = date
        self.online = isOnline
        self.hasUnreadMessages = hasUnread
        
        self.titleLabel.text = name
        
        self.timeLabel.text = "\(date)"
        
        self.avatarImage.image = UIImage(named: "placeholder-user")
        self.avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        self.avatarImage.clipsToBounds = true
        
        self.timeLabel.text = formatDate(date: date)
        
        if isOnline
        {
            self.backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        }else
        {
            self.backgroundColor = .white
        }
        
        if hasUnread
        {
            self.messageLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        }
        else
        {
            self.messageLabel.font = UIFont.systemFont(ofSize: 13)
        }
        
        if message == nil
        {
            self.messageLabel.font = UIFont(name: "Helvetica Neue", size: 13)
            self.messageLabel.text = "No messages yet"
        }
        else
        {
            self.messageLabel.text = message
        }
    }
    
    func formatDate(date : Date) -> String
    {
        let formatter = DateFormatter()
        let calendar = NSCalendar.autoupdatingCurrent
        
        if calendar.isDateInToday(date)
        {
            formatter.setLocalizedDateFormatFromTemplate("HH:mm")
            let dateString = formatter.string(from: date)
            return dateString
        }else
        {
            formatter.setLocalizedDateFormatFromTemplate("dd MMM")
            let dateString = formatter.string(from: date)
            return dateString
        }
    }

    
    
}

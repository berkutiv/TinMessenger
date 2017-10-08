//
//  OutcomeCell.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class OutcomeCell: UITableViewCell, MessageCellConfiguration
{
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //это не используется, но раньше было сделано через два раздельных класса
    var textMessage: String?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configureSelf(message : String)
    {
        self.messageLabel.text = message
        bubbleView.layer.cornerRadius = 10
    }
}

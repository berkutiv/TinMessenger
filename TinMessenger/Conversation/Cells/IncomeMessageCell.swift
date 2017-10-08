//
//  IncomeMessageCell.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class IncomeMessageCell: UITableViewCell, MessageCellConfiguration
{
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var textMessage: String?
    var isIncome : Bool?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configureSelf(message : String, isIncome : Bool)
    {
        self.messageLabel.text = message
        bubbleView.layer.cornerRadius = 10
        if isIncome
        {
            leadingConstraint.priority = UILayoutPriority(rawValue: 999)
            trailingConstraint.priority = UILayoutPriority(rawValue: 1000)
            bubbleView.backgroundColor = UIColor.green.withAlphaComponent(0.4)
        }
        else
        {
            leadingConstraint.priority = UILayoutPriority(rawValue: 1000)
            trailingConstraint.priority = UILayoutPriority(rawValue: 999)
            bubbleView.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        }
    }
}

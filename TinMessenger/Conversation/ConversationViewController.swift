//
//  ConversationViewController.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!

    var navigationTitle : String = ""
    
    let IncomeNIB = UINib(nibName: "IncomeMessageCell", bundle: nil)
    let IncomeReuseIdentifier = "IncomeReuseIdentifier"

//      не используется, но раньше было сделано так
//    let OutcomeNIB = UINib(nibName: "OutcomeCell", bundle: nil)
//    let OutcomeReuseIdentifier = "OutcomeReuseIdentifier"
    
    let messagesDataSource = ["т", "Привет, как дела, че делаиш!", "Привет, как дела, че делаиш! Привет, как дела, че делаиш! Привет, как дела, че делаиш!", "Привет, как дела, че делаиш!", "Привет", "Привет, как дела, че делаиш! Привет, как дела, че делаиш! Привет, как дела, че делаиш!"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = navigationTitle
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IncomeNIB, forCellReuseIdentifier: "IncomeReuseIdentifier")
        //tableView.register(OutcomeNIB, forCellReuseIdentifier: "OutcomeReuseIdentifier")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row % 2 == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeReuseIdentifier", for: indexPath) as! IncomeMessageCell
            cell.configureSelf(message: messagesDataSource[indexPath.row], isIncome: true)
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeReuseIdentifier", for: indexPath) as! IncomeMessageCell
            cell.configureSelf(message: messagesDataSource[1], isIncome: false)
            return cell
        }
    }

}

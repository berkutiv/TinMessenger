//
//  ConversationsListViewController.swift
//  TinMessenger
//
//  Created by Иван on 08.10.2017.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    let ConCellNIB = UINib(nibName: "ConversationTableViewCell", bundle: nil)
    let ConCellReuseIdentifier = "ConCellReuseIdentifier"
    
    let titlesDataSource = ["Вася", "Маша", "Соня", "Петруха", "Саня", "Димоооон", "Колямба", "Оля", "Женя", "Максон", "Иванов Иван Иванович Иванов Иван Иванович Иваныччч"]
    let messagesDataSource = ["нет пока", nil, "Спасибо!", "афвафывафоывалфываолдфыволафволдыаолдвафыолдфаыволдафыволдфвадыжолдфваы", nil, "До свидания, пока, жду и тадад ", nil, "Соня", "Петруха", nil,  "Саня", "Димоооон", "Колямба", "Оля", "Женя", "Максон", nil, nil]
    
    let onlineMessages = NSMutableArray()
    let historyMessages = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ConCellNIB, forCellReuseIdentifier: "ConCellReuseIdentifier")
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "icon"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(profilePressed))]
        self.navigationItem.hidesBackButton = true
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            
        }
        self.navigationItem.title = "Tinkoff Chat"
        configureModels()
    }
    
    
    @objc func profilePressed()
    {
        let storyboard = UIStoryboard(name: "Profile", bundle: Bundle.main)
        let presenting = storyboard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        let navController = UINavigationController(rootViewController: presenting)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    func configureModels()
    {
        for _ in 0..<10
        {
            let randomTitle = Int(arc4random_uniform(UInt32(titlesDataSource.count)))
            let randomMessage = Int(arc4random_uniform(UInt32(messagesDataSource.count)))
            
            let model = DialogModel(name: titlesDataSource[randomTitle], message: messagesDataSource[randomMessage], date: randTime(), online: false, hasUnread: randOnline())
            historyMessages.add(model)
        }
        for _ in 0..<10
        {
            let randomTitle = Int(arc4random_uniform(UInt32(titlesDataSource.count)))
            let randomMessage = Int(arc4random_uniform(UInt32(messagesDataSource.count)))
            
            let model = DialogModel(name: titlesDataSource[randomTitle], message: messagesDataSource[randomMessage], date: randTime(), online: true, hasUnread: randOnline())
            onlineMessages.add(model)
        }
    }
    
    func randTime() -> Date
    {
        let number = arc4random_uniform(UInt32(300000)) + 1000
        let date = Date(timeIntervalSinceNow: TimeInterval(-Int(number)))
        return date
    }
    
    func randOnline() -> Bool
    {
        let online = arc4random_uniform(UInt32(2))
        if online == 0
        {
            return false
        }else
        {
            return true
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConCellReuseIdentifier, for: indexPath) as! ConversationTableViewCell
    
        if indexPath.section == 0
        {
            let model = onlineMessages[indexPath.row] as! DialogModel
            cell.configureSelf(name: model.name , message: model.message, date: model.date, isOnline: model.online, hasUnread: model.hasUnreadMessages!)
            return cell
        }else
        {
            let model = historyMessages[indexPath.row] as! DialogModel
            cell.configureSelf(name: model.name , message: model.message, date: model.date, isOnline: model.online, hasUnread: model.hasUnreadMessages!)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Online"
        }else
        {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath) as! ConversationTableViewCell
        
        let storyboard = UIStoryboard(name: "Profile", bundle: Bundle.main)
        let presenting = storyboard.instantiateViewController(withIdentifier: "conversationVC") as! ConversationViewController
        presenting.navigationTitle = cell.name!
        self.navigationController?.pushViewController(presenting, animated: true)
    }
 
}

//
//  ViewController.swift
//  TinMessenger
//
//  Created by Иван on 20.09.17.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UIView!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        print("viewDidAppear")
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }

}


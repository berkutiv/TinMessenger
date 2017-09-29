//
//  SecondViewController.swift
//  TinMessenger
//
//  Created by Иван on 29.09.17.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var buttonSimple: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidLoad frame \(buttonSimple.frame)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        print("viewWillAppear frame \(buttonSimple.frame)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

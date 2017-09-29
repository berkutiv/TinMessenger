//
//  ViewController.swift
//  TinMessenger
//
//  Created by Иван on 20.09.17.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var cameraBackView: UIView!
    @IBOutlet weak var cameraButton: UIButton!
    
    var photoPicker : UIImagePickerController?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("viewDidLoad frame \(editButton.frame)")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //фрейм выводится одинаковый. По идее, в методе viewDidLoad, фрейм должен отличаться, так как вью еще не подгрузилась полностью и не выставила свои размеры. В данном случае, возможно это из-за стэк вью, либо есть еще вот случай 
        
        super.viewWillAppear(true)
        cameraImage.tintColor = .white
        print("viewWillAppear frame \(editButton.frame)")
        print("viewWillAppear")
        cameraBackView.layer.cornerRadius = cameraBackView.frame.size.width/2
        cameraBackView.clipsToBounds = true
        mainImage.layer.cornerRadius = cameraBackView.frame.height/2
        mainImage.clipsToBounds = true
        editButton.setTitle("Редактировать", for: .normal)
        editButton.layer.cornerRadius = 10
        editButton.layer.borderWidth = 1
        editButton.backgroundColor = .white
        nameLabel.text = "Иван Беркут"
        descriptionLabel.text = "Другой текст, который поменьше"
    }

    @IBAction func cameraButtonPressed(_ sender: Any)
    {
        print("Выбери изображение профиля")
        photoPicker = UIImagePickerController()
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Камера", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera(picker: self.photoPicker!)
        }
        let gallaryAction = UIAlertAction(title: "Галерея", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallery(picker: self.photoPicker!)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func editButtonPressed(_ sender: Any)
    {
        
    }
}


//MARK:- работа с фото
extension ProfileViewController
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if picker == photoPicker
        {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            mainImage.contentMode = .scaleAspectFill
            mainImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func openCamera(picker: UIImagePickerController)
    {
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    func openGallery(picker: UIImagePickerController)
    {
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Raheem Chisman on 7/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bithdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedNamed = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Castung -as ? vs as!
        
        if let newName = storedNamed as? String {
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            bithdayLabel.text = "Birthday: \(newBirthday)"
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        ///store data with key pair using UserDefaults
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        // UserDefaults.standard.synchronize()
        nameLabel.text = "Name: \(nameTextField.text!)"
        bithdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        if (storedName as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "birthday")
            bithdayLabel.text = "Birthday:"
        }
        
    }
}


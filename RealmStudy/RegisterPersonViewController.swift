//
//  RegisterPersonViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/13.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterPersonViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: Any) {
        let newPerson = Person2()
        newPerson.name = nameTextField.text ?? ""
        newPerson.title = titleTextField.text ?? ""
        newPerson.body = bodyTextField.text ?? ""
        do{
            let realm = try Realm()
            try realm.write {
            realm.add(newPerson)
            }
        }catch {
            print("アドできませんでした")
        }
        self.dismiss(animated: false, completion: nil)
    }

}

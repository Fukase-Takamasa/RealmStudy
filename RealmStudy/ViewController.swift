//
//  ViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/09.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    @IBAction func addButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let position = positionTextField.text ?? ""
        addPerson(name: name, position: position)
    }
    
    @IBAction func checkDB(_ sender: Any) {
        let person = realm.objects(Person.self)
        print(person)
        
    }
    
    
    func addPerson(name: String, position: String) {
        let person = Person()
        person.name = name
        person.position = position
        try! realm.write {
            realm.add(person)
        }
    }
    
    
    
}


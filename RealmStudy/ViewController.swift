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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        
        let person = realm.objects(Person.self)
        print(person)
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }

    
}


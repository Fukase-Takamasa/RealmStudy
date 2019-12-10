//
//  ViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/09.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift
import Instantiate
import InstantiateStandard

class ViewController: UIViewController, StoryboardInstantiatable {
    let person = Person()
    var personList: Results<Person>?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        realmMigration()
        
        TableViewUtil.registerCell(tableView, identifier: TableViewCell.reusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let realm = try! Realm()
        
        personList = realm.objects(Person.self)
        print("personList:\(personList)")
        print("RealmDBの中身\(realm.objects(Person.self))")

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    @IBAction func addButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let position = positionTextField.text ?? ""
        addPerson(name: name, position: position)
    }
    
    
    func addPerson(name: String, position: String) {
        person.name = name
        person.position = position
        do{
            let realm = try Realm()
            try realm.write {
            realm.add(person)
            }
                
        }catch {
            print("アドできませんでした")
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableIdentifier, for: indexPath) as! TableViewCell
        guard let personList = personList else {
            return UITableViewCell()
        }
        let name = personList[indexPath.row].name
        let position = personList[indexPath.row].position
        cell.bindData(string1: name, string2: position)
        
        return cell
    }
    
    
    
    
    
}


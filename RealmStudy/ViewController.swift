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
import RxSwift
import RxCocoa

class ViewController: UIViewController, StoryboardInstantiatable {
    var personList: Results<Person>?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var testLabel1: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Realmのモデル定義を変更した時にマイグレーションをあげてDBに反映させる処理。
        realmMigration()
        
        let nameObservable: Observable<String?> = nameTextField.rx.text.asObservable()
        let positionObservable: Observable<String?> = positionTextField.rx.text.asObservable()
        
        nameObservable.bindTo(testLabel1.rx.text).addDisposableTo(DisposeBag)
        positionObservable.bindTo(testLabel2.rx.text).addDisposableTo(DisposeBag)
        
        
        //編集ボタンを右側に表示(アニメーション付き）
        self.navigationItem.setRightBarButton(self.editButtonItem, animated: true)
    
        TableViewUtil.registerCell(tableView, identifier: TableViewCell.reusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let realm = try! Realm()
        
        personList = realm.objects(Person.self)
        print("personList:\(personList)")
        print("RealmDBの中身\(realm.objects(Person.self))")

        //
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let newPerson = Person()
        newPerson.name = nameTextField.text ?? ""
        newPerson.position = positionTextField.text ?? ""
        do{
            let realm = try Realm()
            try realm.write {
            realm.add(newPerson)
            }
        }catch {
            print("アドできませんでした")
        }
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList?.count ?? 0
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    
    
    //セルを削除（RealmDB内も削除）
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            //Realm内で削除
            do {
                let realm = try! Realm()
                try realm.write {
                    realm.delete((self.personList?[indexPath.row])!)
                }
                //tableView上のセルを削除
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }catch {
                
            }
        }
    }

}


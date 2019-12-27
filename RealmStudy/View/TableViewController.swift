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

class TableViewController: UIViewController, StoryboardInstantiatable {
    var personList: Results<Person>?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var testLabel1: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rxのbindの練習（UITextFieldを監視対象に登録）
        let nameObservable: Observable<String?> = nameTextField.rx.text.asObservable()
        let positionObservable: Observable<String?> = positionTextField.rx.text.asObservable()
        
        //bindを反映させる
        nameObservable.bind(to: testLabel1.rx.text).disposed(by: disposeBag)
        positionObservable.bind(to: testLabel2.rx.text).disposed(by: disposeBag)
        
        //編集ボタンを右側に表示(アニメーション付き）
        self.navigationItem.setRightBarButton(self.editButtonItem, animated: true)
    
        TableViewUtil.registerCell(tableView, identifier: TableViewCell.reusableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let realm = try! Realm()
        
        personList = realm.objects(Person.self)
        print("personList:\(personList)")
        print("RealmDBの中身:\(realm.objects(Person.self))")

        //RealmBrowserで中身を参照するためのファイルの保存場所を取得する
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    @IBAction func goGroupedTableViewButton(_ sender: Any) {
        let vc: GroupedTableViewController = GroupedTableViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func addButton(_ sender: Any) {
        let newPerson = Person()
        newPerson.name = nameTextField?.text ?? ""
        newPerson.position = positionTextField?.text ?? ""
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


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList?.count ?? 0
    }
    
    //セルの内容
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


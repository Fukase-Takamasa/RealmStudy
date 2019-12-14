//
//  CollectionViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/11.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift
import Instantiate
import InstantiateStandard

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, StoryboardInstantiatable {
    //RealmDBから取得したデータを辞書のように参照するための箱
    var person2List: Results<Person2>?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addPersonButton: UIBarButtonItem!
    
    @IBAction func addPersonButton(_ sender: Any) {
        
        let registerPersonVc: UIStoryboard! = UIStoryboard(name: "RegisterPersonViewController", bundle: nil)
        let identifier: String! = "RegisterPerson"
        let nextVc = registerPersonVc.instantiateViewController(withIdentifier: identifier)
        self.present(nextVc, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
        print("もうすぐ開きます")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("開きました")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewUtil.registerCell(collectionView, identifier: CollectionViewCell.reusableIdentifier)
        
        let realm = try! Realm()
        person2List = realm.objects(Person2.self)
        print("person2List:\(person2List)")
        print("RealmDBの中身:\(realm.objects(Person2.self))")
        //RealmBrowserで中身を参照するためのファイルの保存場所を取得する
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person2List?.count ?? 0
    }
    
    //セルの内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reusableIdentifier, for: indexPath) as! CollectionViewCell
        guard let person2List = person2List else {
            return UICollectionViewCell()
        }
        let name = person2List[indexPath.row].name
        let title = person2List[indexPath.row].title
        let body = person2List[indexPath.row].body
        cell.bindData(string1: name, string2: title, string3: body)
        return cell
    }
}



extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    //セクションの外側余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //セルサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.collectionView.bounds.width
        let cellHeight = self.collectionView.bounds.height
        return CGSize(width: cellWidth / 2, height: cellHeight / 3)
    }
    
    //列間の余白（□□□
    //
    //　　　　　　□□□）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //行間の余白（□ ＜ー＞　□）？？
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

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
        let storyboard: UIStoryboard = self.storyboard!
        let registerPerson = storyboard.instantiateViewController(identifier: "RegisterPerson")
        self.present(registerPerson, animated: true, completion: nil)
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
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reusableIdentifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            
        }
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

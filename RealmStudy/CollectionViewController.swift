//
//  CollectionViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/11.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, StoryboardInstantiatable {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellectionViewCell", for: indexPath)
        return cell
    }


}

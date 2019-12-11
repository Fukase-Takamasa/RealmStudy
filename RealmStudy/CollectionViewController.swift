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
        CollectionViewUtil.registerCell(collectionView, identifier: CollectionViewCell.reusableIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reusableIdentifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            
        }
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.collectionView.bounds.width - 32 - 16
        let cellHeight = self.collectionView.bounds.height - 32 - 32
        return CGSize(width: cellWidth / 2, height: cellHeight / 3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}

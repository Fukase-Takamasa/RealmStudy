//
//  CollectionViewUtil.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/11.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import Foundation
import UIKit

open class CollectionViewUtil {
    static func registerCell(_ collectionView: UICollectionView, identifier: String) {
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    static func createCell(_ collectionView: UICollectionView, identifier: String, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}


//
//  CollectionViewCell.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/11.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard


class CollectionViewCell: UICollectionViewCell, Reusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    
    func bindData(string1: String, string2: String, string3: String) {
        nameLabel.text = string1
        titleLabel.text = string2
        bodyLabel.text = string3
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

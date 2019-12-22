//
//  GroupedTableViewCell.swift
//  RealmStudy
//
//  Created by 深瀬貴将 on 2019/12/21.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import InstantiateStandard
import Instantiate

class GroupedTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftImageView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func bindData(_ text: String) {
        label.text = text
    }
    
}

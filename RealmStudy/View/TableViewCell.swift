//
//  TableViewCell.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/10.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class TableViewCell: UITableViewCell, Reusable {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func bindData(string1: String, string2: String) {
        label1.text = string1
        label2.text = string2
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

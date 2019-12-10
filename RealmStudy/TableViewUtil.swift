//
//  TableViewUtil.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/10.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit

open class TableViewUtil {
    static func registerCell(_ tableView: UITableView, identifier: String) {
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    static func createCell(_ tableView: UITableView, identifier: String, _ indexPath: IndexPath) -> (UITableViewCell) {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
}

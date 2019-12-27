//
//  GroupedTableViewController.swift
//  RealmStudy
//
//  Created by 深瀬貴将 on 2019/12/21.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard

class GroupedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StoryboardInstantiatable {
    
    let cellConst = [["基本情報","口座情報","管理費等請求情報","管理費等支払い履歴","未納情報"],
                     ["パスワード変更","利用規約"]]
    let cellHeader = ["ユーザー情報", ""]
    let cellImage = ["person.circle.fill","book.fill"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        TableViewUtil.registerCell(tableView, identifier: GroupedTableViewCell.reusableIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellConst.count
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let headerTitle = cellHeader[section]
//        return headerTitle
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "フッター"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 100))
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
 //       <#code#>
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellConst[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GroupedTableViewCell = tableView.dequeueReusableCell(withIdentifier: GroupedTableViewCell.reusableIdentifier, for: indexPath) as! GroupedTableViewCell
        cell.bindData(cellConst[indexPath.section][indexPath.row])
        
        if indexPath.section != 0 {
            cell.leftImageView.isHidden = false
            let cellImage = self.cellImage[indexPath.row]
            cell.leftImageView.image = UIImage(systemName: cellImage)
        }
        return cell
    }
}

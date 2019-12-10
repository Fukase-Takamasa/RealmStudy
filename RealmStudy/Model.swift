//
//  Model.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/09.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import RealmSwift
import Instantiate
import InstantiateStandard

class Person: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var position = ""
    @objc dynamic var createdAt: Double = 0
}


func realmMigration() {
    var config = Realm.Configuration()
    config.schemaVersion = 2
    Realm.Configuration.defaultConfiguration = config
}

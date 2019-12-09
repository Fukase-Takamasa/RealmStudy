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

class Charactors: Object {
    @objc dynamic var family = ""
    @objc dynamic var name = ""
}

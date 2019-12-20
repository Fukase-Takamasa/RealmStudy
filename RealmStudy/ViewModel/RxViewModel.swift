//
//  TableViewModel.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/19.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TableViewModelInputs {
    
}

protocol TableViewModelOutputs {
    
}

protocol TableViewModelType {
    var inputs: TableViewModelInputs {get}
    var outputs: TableViewModelOutputs {get}
}

class TableViewModel: TableViewModelInputs, TableViewModelOutputs {
    //input
    
    
    //output
    
    
    //others
    private let scheduler: SchedulerType
    private let disposeBag = DisposeBag()
    
    
    init(scheduler: SchedulerType = ConcurrentMainScheduler.instance) {
        
        //others
        self.scheduler = scheduler
        
        //output
        
        
        //input
        
        
    }
}

extension TableViewModel: TableViewModelType {
    var inputs: TableViewModelInputs {return self}
    var outputs: TableViewModelOutputs {return self}
}

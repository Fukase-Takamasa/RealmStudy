//
//  RegisterPersonViewController.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/13.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift
import Instantiate
import InstantiateStandard

class RegisterPersonViewController: UIViewController, StoryboardInstantiatable {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
           presentingViewController?.beginAppearanceTransition(false, animated: animated)
           super.viewWillAppear(animated)
   }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       presentingViewController?.endAppearanceTransition()
    }

    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       presentingViewController?.beginAppearanceTransition(true, animated: animated)
       presentingViewController?.endAppearanceTransition()
   }
    
    @IBAction func registerButton(_ sender: Any) {
        let newPerson2 = Person2()
        newPerson2.name = nameTextField?.text ?? ""
        newPerson2.title = titleTextField?.text ?? ""
        newPerson2.body = bodyTextField?.text ?? ""
        do{
            let realm = try Realm()
            try realm.write {
            realm.add(newPerson2)
            }
        }catch {
            print("アドできませんでした")
        }
        self.dismiss(animated: false, completion: nil)
    }

}

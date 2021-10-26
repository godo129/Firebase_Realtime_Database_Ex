//
//  ViewController.swift
//  Firestore_EX
//
//  Created by hong on 2021/10/26.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.child("something").observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            print("values: \(value["name"]!)")
        }
        
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
    }
    
    @objc private func addNewEntry() {
        let object : [String: Any] = [
            "name" : "iOS Academy" as NSObject,
            "Youtube" : "yes"
        ]
        database.child("something_\(Int.random(in: 0..<100))").setValue(object)
    }


}


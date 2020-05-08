//
//  ModelController.swift
//  todo
//
//  Created by user169339 on 5/8/20.
//  Copyright © 2020 user169339. All rights reserved.
//

import UIKit

class ModelController: UIViewController {
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var priorityText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAdd(_ sender: Any) {
        if let controller = self.presentingViewController as? ViewController {
            
            let todo = Todo()
            todo.title = titleText!.text!
            
            if let priority = Int(priorityText!.text!) {
                todo.priority = priority
                controller.add(todo: todo)
                
                controller.dismiss(animated: true, completion: nil)
            }
            

        }
    }
    
}

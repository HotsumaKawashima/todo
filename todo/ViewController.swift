//
//  ViewController.swift
//  todo
//
//  Created by user169339 on 5/8/20.
//  Copyright © 2020 user169339. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
    
        let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = ViewController.todos[indexPath.row].done ? "Done" : "Not"
        
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = String(ViewController.todos[indexPath.row].priority)
        
        let label3 = cell.viewWithTag(3) as! UILabel
        label3.text = ViewController.todos[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let todo = ViewController.todos[sourceIndexPath.row]
        ViewController.todos.remove(at: sourceIndexPath.row)
        ViewController.todos.insert(todo, at: destinationIndexPath.row)
        tableView.reloadData()
        return
        
        
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            ViewController.todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let done = ViewController.todos[indexPath.row].done
        ViewController.todos[indexPath.row].done = !done
        
        table.reloadData()
    }
    
    @IBOutlet weak var table: UITableView!
    
    static var todos: [Todo] = []
    
    @IBAction func onShowModel(_ sender: Any) {
        performSegue(withIdentifier: "toModel", sender: nil)
    }
    
    @IBAction  func onEdit(_ sender: Any) {
        if(self.isEditing) {
            super.setEditing(false, animated: true)
            table.isEditing = false
        } else {
            
            super.setEditing(true, animated: true)
            table.isEditing = true
        }
    }
    
    @IBAction  func onReorder(_ sender: Any) {
        ViewController.todos.sort { $0.priority > $1.priority }
        table.reloadData()
    }
    
    
    func add(todo: Todo) {
        ViewController.todos.append(todo)
        table.reloadData()
    }
}


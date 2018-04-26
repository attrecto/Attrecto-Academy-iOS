//
//  TodoViewController.swift
//  Todo
//
//  Created by Kristóf Varga on 2018. 03. 22..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sortByPriority(todos: &TodoManager.sharedInstance.todos)
        self.tableView.reloadData()
    }
    
    // MARK: - Private
    
    private func sortByPriority(todos: inout [Todo]) {
        todos.sort { (todo1, todo2) -> Bool in
            todo1.priority.value() < todo2.priority.value()
        }
    }

    private func setupUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func dateToString(date: Date?) -> String {
        if let date = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    private func imageForPriority(priority: TodoPriority) -> UIImage? {
        switch priority {
        case .high:
            return UIImage(named: "high")
        case .normal:
            return UIImage(named: "normal")
        default:
            return UIImage(named: "low")
        }
    }

    //MARK: - DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedInstance.todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customTodoCell") as? TodoTableViewCell {

            let todo = TodoManager.sharedInstance.todos[indexPath.row]

            cell.titleLabel.text = todo.title
            cell.descriptionLabel.text = todo.todoDescription
            cell.dateLabel.text = dateToString(date: todo.date)
            cell.todoImageView.image = imageForPriority(priority: todo.priority)
            

            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - TableviewDelegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // TODO: next course
        }
    }
    
}

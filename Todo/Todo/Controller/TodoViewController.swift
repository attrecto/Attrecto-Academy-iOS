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
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let priority = TodoPriority(value: section)
        return TodoManager.sharedInstance.todos(for: priority).count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let priority = TodoPriority(value: section)

        guard TodoManager.sharedInstance.todos(for: priority).count > 0 else {
            return CGFloat.leastNormalMagnitude
        }

        return 30.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let priority = TodoPriority(value: section)

        guard TodoManager.sharedInstance.todos(for: priority).count > 0 else {
            return nil
        }

        return priority.rawValue
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customTodoCell") as? TodoTableViewCell {

            let priority = TodoPriority(value: indexPath.section)

            let todo = TodoManager.sharedInstance.todos(for: priority)[indexPath.row]

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

            let priority = TodoPriority(value: indexPath.section)

            let todo = TodoManager.sharedInstance.todos(for: priority)[indexPath.row]
            TodoManager.sharedInstance.delete(todo: todo)

            self.tableView.deleteRows(at: [indexPath], with: .automatic)

        }
    }
    
}

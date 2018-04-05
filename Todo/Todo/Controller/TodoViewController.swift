//
//  TodoViewController.swift
//  Todo
//
//  Created by Kristóf Varga on 2018. 03. 22..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Action
    
    @IBAction func onAddTodoClick(_ sender: Any) {
        let generatedTodos = newTodos()
        TodoManager.sharedInstance.addTodos(todos: generatedTodos)
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
    }

    private func newTodos() -> [Todo] {
        let todo1 = Todo(title: "Buy milk", todoDescription: nil, date: nil, priority: .low)
        let todo2 = Todo(title: "Learn swift", todoDescription: "Go to Attrecto office, spend hours, listen carefully, profit", date: Date())
        let todo3 = Todo(title: "Valami", todoDescription: nil, date: nil, priority: .high)

        return [todo1, todo2, todo3]
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
}

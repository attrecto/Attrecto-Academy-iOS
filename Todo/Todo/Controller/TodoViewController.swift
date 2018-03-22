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

    private var todos: [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.createTodos()
        self.tableView.reloadData()
    }

    private func setupUI() {
        self.tableView.dataSource = self
    }

    private func createTodos() {
        let todo1 = Todo(title: "Buy milk", todoDescription: nil, date: nil, priority: .normal)
        let todo2 = Todo(title: "Learn swift", todoDescription: "description", date: Date())
        let todo3 = Todo(title: "Valami", todoDescription: nil, date: nil, priority: .high)

        self.todos = [todo1, todo2, todo3]
    }

    //MARK: - DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customTodoCell") as? TodoTableViewCell {

            let todo = self.todos[indexPath.row]

            cell.titleLabel.text = todo.title
            cell.descriptionLabel.text = todo.todoDescription
            

            return cell
        } else {
            return UITableViewCell()
        }
    }
}

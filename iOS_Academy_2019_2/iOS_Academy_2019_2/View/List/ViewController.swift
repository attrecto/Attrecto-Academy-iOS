//
//  ViewController.swift
//  iOS_Academy_2019_2
//
//  Created by Papp Balázs on 2019. 09. 24..
//  Copyright © 2019. Attrecto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getTodosByPriority().count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = getTodosByPriority()
        return sections[section].todos.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = getTodosByPriority()
        return sections[section].priority.stringValue()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        let sections = getTodosByPriority()
        let todo = sections[indexPath.section].todos[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeZone = Calendar.current.timeZone
        formatter.timeStyle = .none
        
        cell.titleLabel.text = todo.title
        cell.descriptionLabel.text = todo.description
        cell.dateLabel.text = formatter.string(from: todo.date)
        
        switch todo.priority {
        case .low:
            cell.backgroundColor = .yellow
        case .medium:
            cell.backgroundColor = .green
        case .high:
            cell.backgroundColor = .red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = getTodosByPriority()
        let todo = sections[indexPath.section].todos[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail" {
            
            let todo = sender as! Todo
            let destinationViewController = segue.destination as! DetailViewController
            destinationViewController.todo = todo
        }
    }
    
    private func getTodosByPriority() -> [Section] {
        var sections = [Section]()
        
        let reversedPriorityCases = Todo.Priority.allCases.reversed()
        
        for priority in reversedPriorityCases {
            let todos = TodoManager.shared.todos(for: priority)
            
            if !todos.isEmpty {
                let section = Section(priority: priority, todos: todos)
                
                sections.append(section)
            }
        }
        
        return sections
    }
}

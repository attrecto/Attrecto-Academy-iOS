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
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.shared.allTodos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        
        let todo = TodoManager.shared.allTodos[indexPath.row]
        
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
        let todo = TodoManager.shared.allTodos[indexPath.row]
        self.performSegue(withIdentifier: "detail", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail" {
            
            let todo = sender as! Todo
            let destinationViewController = segue.destination as! DetailViewController
            destinationViewController.todo = todo
        }
    }
}


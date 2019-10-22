//
//  AddTodoViewController.swift
//  iOS_Academy_2019_2
//
//  Created by kcsaba on 2019. 10. 15.
//  Copyright © 2019. Attrecto. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var nameInputField: UITextField!
    @IBOutlet weak var descriptionInputField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameInputField.resignFirstResponder()
        descriptionInputField.resignFirstResponder()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let name = nameInputField.text ?? "No Name"
        let description = descriptionInputField.text ?? "No Description"
        let date = datePicker.date
        
        let selectedSegmentIndex = prioritySegmentedControl.selectedSegmentIndex
        let priority = Todo.Priority(rawValue: selectedSegmentIndex) ?? .medium
        
        let newTodo = Todo(title: name, description: description, date: date, priority: priority)
        
        TodoManager.shared.addTodo(todo: newTodo)
        navigationController?.popViewController(animated: true)
    }
}

//
//  NewTodoViewController.swift
//  Todo
//
//  Created by Ádám Török on 2018. 04. 12..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit
import PKHUD

class NewTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!

    private var priorities: [TodoPriority] = []
    private var selectedPriority: TodoPriority = .high

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    // MARK: - Actions

    @IBAction func saveTodo(_ sender: Any) {
        if let todo = todo() {
            TodoManager.sharedInstance.addTodo(todo: todo)
            HUD.flash(.success, onView: self.view, delay: 3.0) { (_) in

                self.close()
            }

        } else {
            HUD.flash(.error, onView: self.view, delay: 3.0) { (_) in

                let error = self.formError()
                self.showErrorPopup(todoError: error)
            }
        }
    }

    // MARK: - Class methods
    
    func close() {
        self.navigationController?.popViewController(animated: true)
    }

    func setupView() {
        self.priorityPicker.dataSource = self
        self.priorityPicker.delegate = self

        self.datePicker.datePickerMode = .date

        self.priorities = [TodoPriority.high, TodoPriority.normal, TodoPriority.low]

        self.priorityPicker.reloadAllComponents()
    }
    
    func isTitleValid() -> Bool {
        return self.titleTextField.text != ""
    }
    
    func isDateValid() -> Bool {
        let today = Date()
        
        return self.datePicker.date >= today
    }
    
    func showErrorPopup(todoError: TodoError?) {
        let popup = UIAlertController(title: "Warning", message: todoError?.errorDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        popup.addAction(okAction)
        
        self.present(popup, animated: true, completion: nil)
    }
    
    func formError() -> TodoError? {
        var description = ""
        
        if !isTitleValid() {
            description += "Invalid title\n"
        }
        
        if !isDateValid() {
            description += "Invalid date"
        }
        
        return TodoError(errorDescription: description)
    }
    
    func todo() -> Todo? {
        guard let title = self.titleTextField.text, isTitleValid() else {
            return nil
        }
        
        guard isDateValid() else {
            return nil
        }
        
        let description = self.descriptionTextField.text
        let date = self.datePicker.date
        let priority = self.selectedPriority
        
        return Todo(title: title, todoDescription: description, date: date, priority: priority)
    }

}

extension NewTodoViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.priorities.count
    }

}

extension NewTodoViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.priorities[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedPriority = self.priorities[row]
    }

}

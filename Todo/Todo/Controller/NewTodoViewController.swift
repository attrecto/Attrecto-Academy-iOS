//
//  NewTodoViewController.swift
//  Todo
//
//  Created by Ádám Török on 2018. 04. 12..
//  Copyright © 2018. com.attrecto.academy. All rights reserved.
//

import UIKit

class NewTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!

    private var priorities: [String] = []
    // TODO: delete errorMessage class variable!
    private var errorMessage: String = ""

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    // MARK: - Actions

    @IBAction func saveTodo(_ sender: Any) {
        if self.isValidateTodo() {
        } else {
            let popup = UIAlertController(title: "Warning", message: self.errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

            popup.addAction(okAction)

            self.present(popup, animated: true, completion: nil)
        }
    }

    // MARK: - Class methods

    func setupView() {
        self.priorityPicker.dataSource = self
        self.priorityPicker.delegate = self

        self.datePicker.datePickerMode = .date

        self.priorities = [TodoPriority.high.stringValue(), TodoPriority.normal.stringValue(), TodoPriority.low.stringValue()]

        self.priorityPicker.reloadAllComponents()
    }

    func isValidateTodo() -> Bool {
        self.errorMessage = "The following data are false:\n"
        var valid = true

        if self.titleTextField.text == "" {
            errorMessage += "- title\n"
            valid = false
        }

        // TODO: date format
        let today = Date()
        if self.datePicker.date < today {
            errorMessage += "- date is yesterday"
            valid = false
        }

        return valid
    }

    // TODO: errorMessage
    func getErrorMessage() -> String {
        return ""
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
        return self.priorities[row]
    }

}

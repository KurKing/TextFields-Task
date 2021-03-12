//
//  ViewController.swift
//  TextFields-Task
//
//  Created by Oleksiy on 02.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var textFieldsArray: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(TextFieldTableViewCell.self)
    }

}

//MARK: - Table view data source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: TextFieldTableViewCell.self)
        
        cell.setup(model: TextFieldCellSetupModel(name: "123", placeholder: "Text", isSecure: true, keyboardType: nil, tag: indexPath.row))
        cell.delegate = self
        
        if textFieldsArray.count <= indexPath.row {
            textFieldsArray.append(cell.textField)
        } else {
            textFieldsArray[indexPath.row] = cell.textField
        }
        
        return cell
    }

}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if nextTag < textFieldsArray.count {
            textFieldsArray[nextTag].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

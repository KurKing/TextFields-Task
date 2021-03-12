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
    
    let numberOfInfoCells = 4
    let numberOfPasswordsCells = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCell(TextFieldTableViewCell.self)
        tableView.tableFooterView = UIView()
        
        for _ in 0..<(numberOfPasswordsCells+numberOfInfoCells) {
            textFieldsArray.append(UITextField())
        }
    }

}

//MARK: - Table view data source
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return numberOfInfoCells
        case 2:
            return numberOfPasswordsCells
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "YOUR INFO"
        case 2:
            return "CHANGE PASSWORD"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell()
            cell.textLabel?.text = "Hello"
            return cell
        case 3:
            let cell = UITableViewCell()
            cell.textLabel?.text = "Hello"
            return cell
        default:
            return getTextFieldCell(indexPath: indexPath)
        }
    }
    
    private func getTextFieldCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: TextFieldTableViewCell.self)
        
        cell.setup(model: TextFieldCellSetupModel(name: "\(indexPath.row)", placeholder: "Text", isSecure: indexPath.section != 1, tag: indexPath.section == 1 ? indexPath.row : numberOfInfoCells+indexPath.row))
        cell.delegate = self

        textFieldsArray[indexPath.section == 1 ? indexPath.row : numberOfInfoCells+indexPath.row] = cell.textField

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

//
//  ViewController.swift
//  TextFields-Task
//
//  Created by Oleksiy on 02.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
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
        
        cell.setup(model: TextFieldCellSetupModel(name: "123", placeholder: "Text", isSecure: true, keyboardType: .decimalPad), indexPath: indexPath)
        
        return cell
    }

}

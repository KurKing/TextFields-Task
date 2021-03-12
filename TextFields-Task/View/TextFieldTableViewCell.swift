//
//  TextFieldTableViewCell.swift
//  TextFields-Task
//
//  Created by Oleksiy on 11.03.2021.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textFieldNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private(set) var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(model: TextFieldCellSetupModel, indexPath: IndexPath){
        textFieldNameLabel.text = model.name
        
        textField.placeholder = model.placeholder
        textField.isSecureTextEntry = model.isSecure
        textField.keyboardType = model.keyboardType ?? .default
        
        textField.delegate = self
        
        self.indexPath = indexPath
    }
    
}

//MARK: - UITextFieldDelegate
extension TextFieldTableViewCell: UITextFieldDelegate {
    
}

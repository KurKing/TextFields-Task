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
    
    var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(model: TextFieldCellSetupModel){
        textFieldNameLabel.text = model.name
        
        textField.placeholder = model.placeholder
        textField.isSecureTextEntry = model.isSecure
        
        textField.tag = model.tag
    }
    
}



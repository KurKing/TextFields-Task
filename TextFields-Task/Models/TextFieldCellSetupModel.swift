//
//  TextFieldCellSetupModel.swift
//  TextFields-Task
//
//  Created by Oleksiy on 12.03.2021.
//

import UIKit

struct TextFieldCellSetupModel {
    let name: String
    let placeholder: String

    let isSecure: Bool
    let keyboardType: UIKeyboardType?
    
    let tag: Int
}

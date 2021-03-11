//
//  UITableViewExtension.swift
//  TextFields-Task
//
//  Created by Oleksiy on 11.03.2021.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) where T: ReusableCell, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
 
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}

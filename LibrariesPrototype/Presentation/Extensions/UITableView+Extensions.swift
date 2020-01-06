//
//  UITableView+Extensions.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 05/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        self.register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
}

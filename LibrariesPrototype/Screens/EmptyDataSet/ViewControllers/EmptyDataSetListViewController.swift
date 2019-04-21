//
//  EmptyDataSetListViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import EmptyDataSet_Swift
import UIKit

class EmptyDataSetListViewController: BaseEmptyDataSetListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tableView.emptyDataSetSource = self
    }
}

extension EmptyDataSetListViewController: EmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "List is Empty")
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "List is Empty. Lorem ipsum. List is Empty. Lorem ipsum. List is Empty. Lorem ipsum")
    }
    
}

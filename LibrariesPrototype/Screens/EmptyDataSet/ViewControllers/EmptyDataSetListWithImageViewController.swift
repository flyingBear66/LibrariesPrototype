//
//  EmptyDataSetListViewWithImageController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import EmptyDataSet_Swift
import UIKit

class EmptyDataSetListWithImageViewController: BaseEmptyDataSetListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tableView.emptyDataSetSource = self
    }
}

extension EmptyDataSetListWithImageViewController: EmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "List is Empty")
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "Dog")
    }
    
}

//
//  EmptyDataSetListWithButtonViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import EmptyDataSet_Swift
import UIKit

class EmptyDataSetListWithButtonViewController: BaseEmptyDataSetListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
    }
}

extension EmptyDataSetListWithButtonViewController: EmptyDataSetSource, EmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "List is Empty")
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        return NSAttributedString(string: "Refresh")
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alert = UIAlertController(title: "Empty Data Set Tapped", message: nil, preferredStyle: .alert)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

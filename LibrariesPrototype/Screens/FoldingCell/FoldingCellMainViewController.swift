//
//  FoldingCellMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 01/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import FoldingCell
import UIKit

class FoldingCellMainViewController: LTViewController {
    enum CellHeight {
        static let close: CGFloat = 75
        static let open: CGFloat = 200
        static let count: Int = 5
    }

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        tableView.separatorStyle = .none
        tableView.register(LTFoldingCell.self)
        return tableView
    }()

    // MARK: - Variables
    var cellHeights = [CGFloat](repeating: CellHeight.close, count: CellHeight.count)

    // MARK: - View LifeCycle
    override init() {
        super.init()
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = CellHeight.close
        tableView.rowHeight = UITableView.automaticDimension
    }

    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }
}

extension FoldingCellMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return CellHeight.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LTFoldingCell", for: indexPath) as! LTFoldingCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else { return }

        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == CellHeight.close//Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = CellHeight.open //Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = CellHeight.close
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()

            // fix https://github.com/Ramotion/folding-cell/issues/169
            if cell.frame.maxY > tableView.frame.maxY {
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            }
        }, completion: nil)
    }
    
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as LTFoldingCell = cell else { return }

        cell.backgroundColor = .clear

        if cellHeights[indexPath.row] == CellHeight.close {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }

        cell.number = indexPath.row
    }
}

//
//  MainStretchyHeaderViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 28/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import EmptyDataSet_Swift
import RxCocoa
import RxSwift
import SVProgressHUD
import UIKit

class MainStretchyHeaderViewController: LTRXViewController {
    
    // MARK: - UIControls
    let collectionView: LTCollectionView = {
        let layout = StretchyHeaderLayout()
//        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .vertical
        let collectionView = LTCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(StretchyHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: "header")
        return collectionView
    }()
    
    var headerView: StretchyHeaderView?
    
    // MARK: - Variables
    var viewModel = ReposViewModel()
    

    
    // MARK: - View LifeCycle
    
    init(viewModel: ReposViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModel()
    }
    
    // MARK: - Helpers
    private func setupViews() {
        // View
        title = "StretchyHeader"
        view.backgroundColor = .white
        
        // CollectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.emptyDataSetSource = self
        view.addSubview(collectionView)
        
        collectionView.addConstraints(equalToSuperview())
    }
    
    private func setupViewModel() {
        // observing loading state
        viewModel
            .loading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { loading in
                if loading {
                    print("Loading")
                    self.showLoadingIndicator()
                } else {
                    print("Finished")
                    self.hideLoadingIndicator()
                }
            }).disposed(by: disposeBag)
        
        // observing errors to show
        viewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { error in
                switch error {
                case .internalError(let message):
                    print("Internal Error \(message)")
                case .serverError(let message):
                    print("Server Error \(message)")
                }
            })
            .disposed(by: disposeBag)
        
        // observe Repo changes
        // binding repos to view
        viewModel
            .repositoryViewModels
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                print("repos Changed")
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.getRepos()
    }

}

// MARK: - CollectionView DataSource
extension MainStretchyHeaderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.repositoryViewModels.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? RepositoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let cellViewModel = viewModel.repositoryViewModels.value[indexPath.row]
        cell.viewModel = cellViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? StretchyHeaderView
        
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
}

extension MainStretchyHeaderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY > 0 {
            return  
        }
        
        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
    }
    
}

extension MainStretchyHeaderViewController: EmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "No Public Repos :(")
    }
}

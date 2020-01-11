//
//  MainViewController.swift
//  testiOSOzgunEmreZor
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import EmptyDataSet_Swift
import RxCocoa
import RxSwift
import SVProgressHUD
import UIKit

class ReposViewController: LTRXViewController {
    // MARK: - UIControls
    
    let collectionView: LTCollectionView = {
        let layout = LTCollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        let newCollectionView = LTCollectionView(frame: .zero, collectionViewLayout: layout)
        newCollectionView.backgroundColor = .clear
        newCollectionView.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return newCollectionView
    }()
    
    // MARK: - Variables
    var viewModel = ReposViewModel()

    // MARK: - View LifeCycle
    
    init(viewModel: ReposViewModel) {
        super.init()
        self.viewModel = viewModel
    }

    @available(*, unavailable)
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
        title = "FlyingBear Public Repos"
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
            })
            .disposed(by: disposeBag)
        
        viewModel.getRepos()
    }

    // MARK: - UIActions
}

// MARK: - CollectionView DataSource

extension ReposViewController: UICollectionViewDataSource {
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
}

extension ReposViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = 100
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(kWhateverHeightYouWant))
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.repositoryViewModels.value.count - 2 {
//            viewModel.getReposMore()
        }
    }
}

extension ReposViewController: EmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: "No Public Repos :(")
    }
}

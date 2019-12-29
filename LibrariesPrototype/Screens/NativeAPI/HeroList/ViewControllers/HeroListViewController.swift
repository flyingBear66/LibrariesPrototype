//
//  HeroListViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroListViewController: BaseHeroViewController {
    // MARK: - Variables
    private var viewModel: HeroListViewModel!
    
    // MARK: - View LifeCycle
    init(withViewModel viewModel: HeroListViewModel) {
        super.init()
        self.viewModel = viewModel
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        bindViewModel()
        viewModel.getHeros()
    }

    // MARK: - Helpers
    func setupViews() {
        title = "Marvel Heroes"
        view.backgroundColor = .lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }

    func updateUI() {
        view.addSubview(collectionView)
        collectionView.addConstraints(equalToSuperview())
    }

    func bindViewModel() {
        viewModel.heroCellViewModels.bind { [weak self] _ in
            print("HerosDidLoad")
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        viewModel.herosDidError.bind { errorMessage in
            print(errorMessage)
        }
        viewModel.loading.bind { loading in
            DispatchQueue.main.async {
                if loading {
                    self.showLoadingIndicator()
                } else {
                    self.hideLoadingIndicator()
                }
            }
        }
    }
    
    func openSeachScreen() {
        let heroSearchService = HeroSearchService()
        let heroSearchViewModel = HeroSearchViewModel(withService: heroSearchService)
        let heroSearchViewController = HeroSearchViewController(withViewModel: heroSearchViewModel)
        
        navigationController?.pushViewController(heroSearchViewController, animated: true)
    }
    
    // MARK: - UI Actions
    @objc func searchTapped() {
        viewModel.openScreen(withHeroScreen: .search)
    }
}

extension HeroListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.heroCellViewModels.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = viewModel.heroCellViewModels.value[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCellIdentifiers.heroCell, for: indexPath) as! HeroCollectionViewCell
        cell.viewModel = cellViewModel
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.openScreen(withHeroScreen: .detail, selectedIndexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !viewModel.loading.value && indexPath.row == viewModel.heroCellViewModels.value.count - 2 {
            viewModel.getMoreHeros()
        }
    }
}


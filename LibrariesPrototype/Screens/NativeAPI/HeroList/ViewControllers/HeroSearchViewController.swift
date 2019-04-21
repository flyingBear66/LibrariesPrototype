//
//  HeroSearchViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/8/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroSearchViewController: BaseHeroViewController {
    
    // MARK: - UIControls
        
    // MARK: - Variables
    private var viewModel: HeroSearchViewModel!
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View LifeCycle
    required init(withViewModel viewModel: HeroSearchViewModel) {
        super.init()
        self.viewModel = viewModel
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        bindViewModel()
    }
    
    // MARK: - Helpers
    func setupViews() {
        title = "Search Heroes"
        view.backgroundColor = .lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateUI() {
        view.addSubview(collectionView)
        collectionView.addConstraints(equalToSuperview())
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Heroes"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    func bindViewModel() {
        viewModel.searchHeroCellViewModels.bind { [weak self] _ in
            print("SearchHerosDidLoad")
            DispatchQueue.main.sync {
                self?.collectionView.collectionViewLayout.invalidateLayout()
                self?.collectionView.reloadData()
            }
        }
        viewModel.searchHerosDidError.bind { errorMessage in
            print(errorMessage)
        }
        viewModel.loading.bind { [weak self] loading in
            DispatchQueue.main.async {
                if loading {
                    self?.showLoadingIndicator()
                } else {
                    self?.hideLoadingIndicator()
                }
            }
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension HeroSearchViewController  : UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        if searchBarIsEmpty() {
            return
        }
        viewModel.getHeros(with: searchText)
    }
}

extension HeroSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchHeroCellViewModels.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = viewModel.searchHeroCellViewModels.value[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCellIdentifiers.heroCell, for: indexPath) as! HeroCollectionViewCell
        cell.viewModel = cellViewModel
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCellViewModel = viewModel.searchHeroCellViewModels.value[indexPath.row]
        self.selectedCell = (collectionView.cellForItem(at: indexPath) as! HeroCollectionViewCell)

        let heroDetailService = HeroDetailService()
        let heroDetailViewModel = HeroDetailViewModel(withService: heroDetailService, heroId: selectedCellViewModel.heroId)
        let heroDetailViewController = HeroDetailViewController(withViewModel: heroDetailViewModel)

        navigationController?.pushViewController(heroDetailViewController, animated: true)
        
        heroDetailViewModel.favorited.bind { favorited in
            DispatchQueue.main.async {
                selectedCellViewModel.favorited.value = favorited
            }
        }
    }
}

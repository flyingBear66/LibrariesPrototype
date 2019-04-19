//
//  HeroDetailViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroDetailViewController: LTViewController {
    
    static let cardCornerRadius: CGFloat = 5

    // MARK: - UIControls

    let heroNameLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.text = "HeroName"
        return label
    }()

    let scrollView: LTScrollView = {
        let scrollView = LTScrollView()
        return scrollView
    }()

    let containerView: LTView = {
        let containerView = LTView()
        return containerView
    }()
    
    let dismissButton: LTButton = {
        let button = LTButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(dismissDetail), for: .touchUpInside)
        return button
    }()
    
    let favoriteButton: FavoriteButton = {
        let button = FavoriteButton()
        button.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        return button
    }()
    
    let comicsView: HeroDetailContainerView = {
        let view = HeroDetailContainerView()
        view.containerTitleLabel.text = "Comics"
        view.backgroundColor = .blue
        return view
    }()

    let eventsView: HeroDetailContainerView = {
        let view = HeroDetailContainerView()
        view.containerTitleLabel.text = "Events"
        view.backgroundColor = .yellow
        return view
    }()


    let seriesView: HeroDetailContainerView = {
        let view = HeroDetailContainerView()
        view.containerTitleLabel.text = "Series"
        view.backgroundColor = .red
        return view
    }()

    let storiesView: HeroDetailContainerView = {
        let view = HeroDetailContainerView()
        view.containerTitleLabel.text = "Stories"
        view.backgroundColor = .green
        return view
    }()

    // MARK: - Variables
    private var viewModel: HeroDetailViewModel!
    
    // MARK: - View LifeCycle
    required init(with viewModel: LTViewModel) {
        super.init()
        self.viewModel = (viewModel as! HeroDetailViewModel)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        bindViewModel()
        viewModel.getHeroDetail()
    }
    
    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .lightGray
    }
    
    func updateUI() {
        // Adding Views
        containerView.addSubview(comicsView)
        containerView.addSubview(eventsView)
        containerView.addSubview(seriesView)
        containerView.addSubview(storiesView)
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        view.addSubview(heroNameLabel)
        view.addSubview(dismissButton)
        view.addSubview(favoriteButton)

        // Adding Constraints
        dismissButton.addConstraints([equal(view, \.topAnchor, constant: 50),
                                      equal(view, \.trailingAnchor, constant: -20)])
        
        favoriteButton.addConstraints([equal(view, \.topAnchor, constant: 50),
                                       equal(view, \.leadingAnchor, constant: 20)])
        
        comicsView.addConstraints([equal(containerView, \.topAnchor),
                                   equal(view, \.trailingAnchor, constant: -8),
                                   equal(view, \.leadingAnchor, constant: 8)])

        eventsView.addConstraints([equal(comicsView, \.topAnchor, \.bottomAnchor, constant: 20),
                                   equal(view, \.trailingAnchor, constant: -8),
                                   equal(view, \.leadingAnchor, constant: 8)])

        seriesView.addConstraints([equal(eventsView, \.topAnchor, \.bottomAnchor, constant: 20),
                                   equal(view, \.trailingAnchor, constant: -8),
                                   equal(view, \.leadingAnchor, constant: 8)])

        storiesView.addConstraints([equal(seriesView, \.topAnchor, \.bottomAnchor, constant: 20),
                                    equal(view, \.trailingAnchor, constant: -8),
                                    equal(containerView, \.bottomAnchor, constant: 100),
                                    equal(view, \.leadingAnchor, constant: 8)])

        scrollView.addConstraints([equal(view, \.topAnchor, constant: 150),
                                   equal(view, \.trailingAnchor),
                                   equal(view, \.bottomAnchor),
                                   equal(view, \.leadingAnchor)])

        containerView.addConstraints([equal(view, \.trailingAnchor),
                                      equal(view, \.leadingAnchor)])

        heroNameLabel.addConstraints([equal(view, \.topAnchor, constant: 100),
                                      equal(view, \.trailingAnchor),
                                      equal(view, \.leadingAnchor)])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateContentSize()
    }

    func updateContentSize() {
        let scrollViewContentSizeHeight = comicsView.frame.height + eventsView.frame.height + seriesView.frame.height + storiesView.frame.height
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        scrollView.contentSize = CGSize(width: screenWidth, height: scrollViewContentSizeHeight + 100)
    }
    
    func bindViewModel() {
        viewModel.comicViewModels.bind { [weak self] comicViewModels in
            if comicViewModels.isEmpty {
                DispatchQueue.main.async {
                    self?.comicsView.removeDetailViews()
                }
                return
            }
            for i in 0..<comicViewModels.count   {
                DispatchQueue.main.async {
                    self?.comicsView.detailViews[i].titleLabel.text = comicViewModels[i].title
                    self?.comicsView.detailViews[i].descriptionLabel.text = comicViewModels[i].comicDescription
                    self?.updateContentSize()
                }
            }
        }
        viewModel.eventViewModels.bind { [weak self] eventViewModels in
            if eventViewModels.isEmpty {
                DispatchQueue.main.async {
                    self?.eventsView.removeDetailViews()
                }
                return
            }
            
            for i in 0..<eventViewModels.count {
                DispatchQueue.main.async {
                    self?.eventsView.detailViews[i].titleLabel.text = eventViewModels[i].title
                    self?.eventsView.detailViews[i].descriptionLabel.text = eventViewModels[i].eventDescription
                    self?.updateContentSize()
                }
            }
        }
        viewModel.serieViewModels.bind { [weak self] serieViewModels in
            if serieViewModels.isEmpty {
                DispatchQueue.main.async {
                    self?.seriesView.removeDetailViews()
                    self?.updateContentSize()
                }
                return
            }

            for i in 0..<serieViewModels.count {
                DispatchQueue.main.async {
                    self?.seriesView.detailViews[i].titleLabel.text = serieViewModels[i].title
                    self?.seriesView.detailViews[i].descriptionLabel.text = serieViewModels[i].serieDescription
                    self?.updateContentSize()
                }
            }
        }
        viewModel.storyViewModels.bind { [weak self] storyViewModels in
            if storyViewModels.isEmpty {
                DispatchQueue.main.async {
                    self?.storiesView.removeDetailViews()
                }
                return
            }
            for i in 0..<storyViewModels.count {
                DispatchQueue.main.async {
                    self?.storiesView.detailViews[i].titleLabel.text = storyViewModels[i].title
                    self?.storiesView.detailViews[i].descriptionLabel.text = storyViewModels[i].storyDescription
                    self?.updateContentSize()
                }
            }
        }
        
        viewModel.favoritedDetail.bindAndFire { favoritedDetail in
            DispatchQueue.main.async {
                self.favoriteButton.isSelected = favoritedDetail
            }
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
    
    // MARK: - UI Actions
    @objc func dismissDetail() {
        dismiss(animated: true, completion: nil)
    }

    @objc func favoriteTapped() {
        viewModel.favoriteTapped()
    }

}

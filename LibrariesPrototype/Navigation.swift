//
//  Navigation.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class Navigation {
    
    enum Storyboard: String {
        case none = ""
    }
    
    // MARK: - Private
    public var navigationController: LTNavigationController
    private var window: LTWindow
    private var currentViewController: LTViewController!
    
    // MARK: - Lifecycle
    init(window: LTWindow) {
        self.navigationController = LTNavigationController()
        self.window = window
    }
    
}
// MARK: - Public
extension Navigation {
    func getCurrentView() -> UIView {
        
        guard let topView = navigationController.topViewController?.view else {
            return LTView()
        }
        
        return topView
    }
    
    func firstScreenAsSplash() {
        openSplash()
    }
    
}

// MARK: - Private
extension Navigation {
    
    // MARK: Native Networking Test with Marvel API
    private func openSplash() {
        let service = SplashService()
        let viewModel = SplashViewModel(with: service)
        
        viewModel.showMainMenu = { [unowned self] in
            self.openMainMenu()
        }
        
        currentViewController = SplashViewController(with: viewModel)
        navigateTo(viewContoller: currentViewController!, SplashViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openMainMenu() {
        let service = MainService()
        let viewModel = MainViewModel(with: service)
        
        viewModel.showNativeNetworkingScreens = { [unowned self] in
            self.openNativeNetworkingTestScreens()
        }
        
        viewModel.showEmptyDataSet = { [unowned self] in
            self.openEmptyDataSetScreens()
        }
        
        currentViewController = MainViewController(with: viewModel)
        navigateTo(viewContoller: currentViewController!, MainViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openNativeNetworkingTestScreens() {
        let service = HeroListService()
        let viewModel = HeroListViewModel(with: service)
        
        viewModel.showHeroSearch = { [unowned self] in
            self.openHeroSearchScreen()
        }
        
        viewModel.showHeroDetail = { [unowned self] heroId in
            self.openHeroDetailScreen(withHeroId: heroId)
        }
            
        currentViewController = HeroListViewController(with: viewModel)
        pushTo(viewContoller: currentViewController, HeroListViewController.self)
    }
    
    private func openHeroDetailScreen(withHeroId heroId: Int) {
        let heroDetailService = HeroDetailService()
        let heroDetailViewModel = HeroDetailViewModel(with: heroDetailService, heroId: heroId)
        
        // TODO: make it work with favorited closures.
//        heroDetailViewModel.favorited.bind { favorited in
//            favoritedClosure(favorited)
//        }
        currentViewController = HeroDetailViewController(with: heroDetailViewModel)
        pushTo(viewContoller: currentViewController, HeroDetailViewController.self)
    }

    private func openHeroSearchScreen() {
        let heroSearchService = HeroSearchService()
        let heroSearchViewModel = HeroSearchViewModel(with: heroSearchService)
        currentViewController = HeroSearchViewController(with: heroSearchViewModel)
        pushTo(viewContoller: currentViewController, HeroSearchViewController.self)
    }
    
    // MARK: Empty Data Set
    private func openEmptyDataSetScreens() {
        
    }
    
}

// MARK: - Navigate methods
extension Navigation {
    
    private func showInWindow<T: LTViewController>(viewContoller: Any, _:T.Type) {
        self.window.rootViewController = (viewContoller as! T)
        self.window.makeKeyAndVisible()
    }
    
    private func navigateTo<T: LTViewController>(viewContoller: Any, _:T.Type) {
        self.navigationController = LTNavigationController(rootViewController: (viewContoller as! T))
        self.window.rootViewController = (viewContoller as! T).navigationController
    }
    
    private func pushTo<T: LTViewController>(viewContoller: Any, _:T.Type) {
        self.navigationController.pushViewController((viewContoller as! T), animated: true)
    }
    
    private func present<T: LTViewController>(viewContoller: Any, _:T.Type,
                                              animated: Bool = true, completion: (() -> Void)?) {
        present(viewContoller: viewContoller, T.self, withNavigationController: false, animated: animated, completion: completion)
    }
    
    private func present<T: LTViewController>(viewContoller: Any, _:T.Type, withNavigationController: Bool,
                                              animated: Bool = true, completion: (() -> Void)?) {
        let topViewController = self.navigationController.topViewController as! LTViewController
        
        if withNavigationController {
            topViewController.present(LTNavigationController(rootViewController: (viewContoller as! T)), animated: animated, completion: completion)
        } else {
            topViewController.present((viewContoller as! T), animated: animated, completion: completion)
        }
    }
}
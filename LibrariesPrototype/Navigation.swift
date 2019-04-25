//
//  Navigation.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Swinject
import UIKit

class Navigation {
    
    enum Storyboard: String {
        case none = ""
    }
    
    // MARK: - Private
    public var navigationController: LTNavigationController
    private var window: LTWindow
    private var currentViewController: LTViewController!
    
    lazy var container = Container() { container in
        // Networking Clients
        container.register(MarvelAPIClient.self) { _ in MarvelAPIClient(publicKey: "8b588a7a6c43e67b5a8baea03512f8db",
                                                                        privateKey: "c1fdb043e31867a447e8b1cb9232e649ae7ebf8f")}
        container.register(AlamofireHTTPClient.self) { _ in AlamofireHTTPClient()}
        
        // Services
        container.register(MainService.self) { r in MainService(withMarvelAPIClient: r.resolve(MarvelAPIClient.self)!,
                                                                githubAPIClient: r.resolve(AlamofireHTTPClient.self)!)}
        
        // ViewModels
        container.register(MainViewModel.self) { r in
            let viewModel = MainViewModel(withService: r.resolve(MainService.self)!)
            viewModel.showNativeNetworkingScreens = { [unowned self] in
                self.openNativeNetworkingTestScreens()
            }
            
            viewModel.showEmptyDataSet = { [unowned self] in
                self.openEmptyDataSetScreens()
            }
            
            viewModel.showRxSwiftScreens = { [unowned self] in
                self.openRxSwiftAlamofireScreens()
            }
            
            viewModel.showGradientLoadingBarScreens = { [unowned self] in
                self.openGradientLoadingBarScreens()
            }
            return viewModel
        }
        
        // ViewController
        container.register(MainViewController.self) { r in MainViewController(withViewModel: r.resolve(MainViewModel.self)!)}
    }

    
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
        let viewModel = SplashViewModel(withService: service)
        
        viewModel.showMainMenu = { [unowned self] in
            self.openMainMenu()
        }
        
        currentViewController = SplashViewController(withViewModel: viewModel)
        navigateTo(viewContoller: currentViewController!, SplashViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openMainMenu() {
        currentViewController = container.resolve(MainViewController.self)!
        navigateTo(viewContoller: currentViewController!, MainViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openNativeNetworkingTestScreens() {
        let service = HeroListService()
        let viewModel = HeroListViewModel(withService: service)
        
        viewModel.showHeroSearch = { [unowned self] in
            self.openHeroSearchScreen()
        }
        
        viewModel.showHeroDetail = { [unowned self] heroId in
            self.openHeroDetailScreen(withHeroId: heroId)
        }
            
        currentViewController = HeroListViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, HeroListViewController.self)
    }
    
    private func openHeroDetailScreen(withHeroId heroId: Int) {
        let heroDetailService = HeroDetailService()
        let heroDetailViewModel = HeroDetailViewModel(withService: heroDetailService, heroId: heroId)
        
        // TODO: make it work with favorited closures.
//        heroDetailViewModel.favorited.bind { favorited in
//            favoritedClosure(favorited)
//        }
        currentViewController = HeroDetailViewController(withViewModel: heroDetailViewModel)
        pushTo(viewContoller: currentViewController, HeroDetailViewController.self)
    }

    private func openHeroSearchScreen() {
        let heroSearchService = HeroSearchService()
        let heroSearchViewModel = HeroSearchViewModel(withService: heroSearchService)
        currentViewController = HeroSearchViewController(withViewModel: heroSearchViewModel)
        pushTo(viewContoller: currentViewController, HeroSearchViewController.self)
    }
    
    // MARK: Empty Data Set
    private func openEmptyDataSetScreens() {
        let viewModel = MainEmptyDataSetListViewModel()
        
        viewModel.showEmptyDataSetList = { [unowned self] in
            self.openEmptyDataSetList()
        }
        
        viewModel.showEmptyDataSetListWithImage = { [unowned self] in
            self.openEmptyDataSetListWithImage()
        }
        
        viewModel.showEmptyDataSetListWithButton = { [unowned self] in
            self.openEmptyDataSetListWithButton()
        }
        
        currentViewController = MainEmptyDataSetListViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, MainEmptyDataSetListViewController.self)
    }
    
    private func openEmptyDataSetList() {
        currentViewController = EmptyDataSetListViewController()
        pushTo(viewContoller: currentViewController, EmptyDataSetListViewController.self)
    }
    
    private func openEmptyDataSetListWithButton() {
        currentViewController = EmptyDataSetListWithButtonViewController()
        pushTo(viewContoller: currentViewController, EmptyDataSetListWithButtonViewController.self)
    }
    
    private func openEmptyDataSetListWithImage() {
        currentViewController = EmptyDataSetListWithImageViewController()
        pushTo(viewContoller: currentViewController, EmptyDataSetListWithImageViewController.self)
    }
    
    // MARK: RxSwift+Alamofire

    private func openRxSwiftAlamofireScreens() {
        currentViewController = ReposViewController()
        pushTo(viewContoller: currentViewController, ReposViewController.self)
    }

    // MARK: GradientLoadingBar
    private func openGradientLoadingBarScreens() {
        let viewModel = GradientLoadingMainViewModel()

        viewModel.showButtonScreens = { [unowned self] in
            self.openGradientLoadingButton()
        }

        viewModel.showStatusBarScreens = { [unowned self] in
            self.openGradientLoadingStatusBar()
        }

        viewModel.showStatusBarWithSafeAreaScreens = { [unowned self] in
            self.openGradientLoadingStatusBarWithSafeArea()
        }

        currentViewController = GradientLoadingMainViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, GradientLoadingMainViewController.self)
    }

    private func openGradientLoadingButton() {
        let viewModel = GradientLoadingButtonViewModel()
        currentViewController = GradientLoadingButtonViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, GradientLoadingButtonViewController.self)
    }

    private func openGradientLoadingStatusBar() {
        let viewModel = GradientLoadingStatusBarViewModel()
        currentViewController = GradientLoadingStatusBarViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, GradientLoadingStatusBarViewController.self)
    }

    private func openGradientLoadingStatusBarWithSafeArea() {
        let viewModel = GradientLoadingStatusBarWithSafeAreaViewModel()
        currentViewController = GradientLoadingStatusBarWithSafeAreaViewController(withViewModel: viewModel)
        pushTo(viewContoller: currentViewController, GradientLoadingStatusBarWithSafeAreaViewController.self)
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

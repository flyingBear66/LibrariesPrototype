//
//  Navigation.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import SwiftUI
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
    
    let container = Container()
    
    // MARK: - Lifecycle
    init(window: LTWindow) {
        self.navigationController = LTNavigationController()
        self.window = window
        
        registerApp()
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
        currentViewController = container.resolve(SplashViewController.self)
        navigateTo(viewContoller: currentViewController!, SplashViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openMainMenu() {
        currentViewController = container.resolve(MainViewController.self)!
        navigateTo(viewContoller: currentViewController!, MainViewController.self)
    }
    
    // MARK: Native Networking Test with Marvel API
    private func openNativeNetworkingTestScreens() {
        currentViewController = container.resolve(HeroListViewController.self)!
        pushTo(viewContoller: currentViewController, HeroListViewController.self)
    }
    
    private func openHeroDetailScreen(withHeroId heroId: Int) {
        let viewController: HeroDetailViewController = container.resolve(HeroDetailViewController.self)!
        viewController.heroId = heroId
        currentViewController = viewController
        pushTo(viewContoller: currentViewController, HeroDetailViewController.self)
    }

    private func openHeroSearchScreen() {
        currentViewController = container.resolve(HeroSearchViewController.self)!
        pushTo(viewContoller: currentViewController!, HeroSearchViewController.self)
    }
    
    // MARK: Empty Data Set
    private func openEmptyDataSetScreens() {
        currentViewController = container.resolve(MainEmptyDataSetListViewController.self)!
        pushTo(viewContoller: currentViewController, MainEmptyDataSetListViewController.self)
    }
    
    private func openEmptyDataSetList() {
        currentViewController = container.resolve(EmptyDataSetListViewController.self)!
        pushTo(viewContoller: currentViewController, EmptyDataSetListViewController.self)
    }
    
    private func openEmptyDataSetListWithButton() {
        currentViewController = container.resolve(EmptyDataSetListWithButtonViewController.self)!
        pushTo(viewContoller: currentViewController, EmptyDataSetListWithButtonViewController.self)
    }
    
    private func openEmptyDataSetListWithImage() {
        currentViewController = container.resolve(EmptyDataSetListWithImageViewController.self)!
        pushTo(viewContoller: currentViewController, EmptyDataSetListWithImageViewController.self)
    }
    
    // MARK: RxSwift+Alamofire
    private func openRxSwiftAlamofireScreens() {
        currentViewController = container.resolve(ReposViewController.self)!
        pushTo(viewContoller: currentViewController, ReposViewController.self)
    }

    // MARK: GradientLoadingBar
    private func openGradientLoadingBarScreens() {
        currentViewController = container.resolve(GradientLoadingMainViewController.self)!
        pushTo(viewContoller: currentViewController, GradientLoadingMainViewController.self)
    }

    private func openGradientLoadingButton() {
        currentViewController = container.resolve(GradientLoadingButtonViewController.self)!
        pushTo(viewContoller: currentViewController, GradientLoadingButtonViewController.self)
    }

    private func openGradientLoadingStatusBar() {
        currentViewController = container.resolve(GradientLoadingStatusBarViewController.self)!
        pushTo(viewContoller: currentViewController, GradientLoadingStatusBarViewController.self)
    }

    private func openGradientLoadingStatusBarWithSafeArea() {
        currentViewController = container.resolve(GradientLoadingStatusBarWithSafeAreaViewController.self)!
        pushTo(viewContoller: currentViewController, GradientLoadingStatusBarWithSafeAreaViewController.self)
    }
    
    // MARK: Stretchy Header
    private func openMainStretchyHeaderViewController() {
        currentViewController = container.resolve(MainStretchyHeaderViewController.self)!
        pushTo(viewContoller: currentViewController, MainStretchyHeaderViewController.self)
    }

    // MARK: SwiftUI Screens
    private func openSwiftUIScreens() {
        // Create the SwiftUI view that provides the window contents.
        hostView(view: container.resolve(ContentView.self)!)
    }
}

// MARK: - Navigate methods
extension Navigation {
    private func hostView(view: ContentView) {
        // Use a UIHostingController as window root view controller.
        self.window.rootViewController = UIHostingController(rootView: view)
        self.window.makeKeyAndVisible()
    }
    
    private func showInWindow<T: LTViewController>(viewContoller: Any, _:T.Type) {
        self.window.rootViewController = (viewContoller as! T)
        self.window.makeKeyAndVisible()
    }
    
    private func navigateTo<T: LTViewController>(viewContoller: Any, _:T.Type) {
        self.navigationController = LTNavigationController(rootViewController: (viewContoller as! T))
        self.window.rootViewController = (viewContoller as! T).navigationController
    }
    
    private func pushTo<T: LTViewController>(viewContoller: LTViewController, _:T.Type) {
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

// MARK: - Swifject methods
extension Navigation {
    private func registerApp() {
        registerHTTPClients()
        registerGradientLoadingBar()
        registerEmptyDataSetScreens()
        registerMainScreen()
        registerNativeNetworkingScreens()
        registerSplash()
        registerRxSwiftScreens()
        registerStretchyHeaderScreens()
        registerSwiftUIScreens()
    }
    
    private func registerSplash() {
        // Services
        container.register(SplashService.self) { _ in
            SplashService()
        }
        
        // ViewModels
        container.register(SplashViewModel.self) { r in
            let viewModel = SplashViewModel(withService: r.resolve(SplashService.self)!)
            
            viewModel.showMainMenu = { [unowned self] in
                self.openMainMenu()
            }
            
            return viewModel
        }
    
        // ViewControllers
        container.register(SplashViewController.self) { r in
            SplashViewController(withViewModel: r.resolve(SplashViewModel.self)!)
        }
    }
    
    private func registerHTTPClients() {
        // Networking Clients
        container.register(MarvelAPIClient.self) { _ in MarvelAPIClient(publicKey: "8b588a7a6c43e67b5a8baea03512f8db",
                                                                        privateKey: "c1fdb043e31867a447e8b1cb9232e649ae7ebf8f")}
        container.register(AlamofireHTTPClient.self) { _ in AlamofireHTTPClient()}
    }
    
    private func registerGradientLoadingBar() {
        // ViewModels
        container.register(GradientLoadingMainViewModel.self) { _ in
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
            return viewModel
        }
        
        container.register(GradientLoadingButtonViewModel.self) { _ in
            GradientLoadingButtonViewModel()
        }
        
        container.register(GradientLoadingStatusBarViewModel.self) { _ in
            GradientLoadingStatusBarViewModel()
        }
        
        container.register(GradientLoadingStatusBarWithSafeAreaViewModel.self) { _ in
            GradientLoadingStatusBarWithSafeAreaViewModel()
        }
        
        // ViewControllers
        container.register(GradientLoadingMainViewController.self) { r in
            GradientLoadingMainViewController(withViewModel: r.resolve(GradientLoadingMainViewModel.self)!)
        }
        
        container.register(GradientLoadingButtonViewController.self) { r in
            GradientLoadingButtonViewController(withViewModel: r.resolve(GradientLoadingButtonViewModel.self)!)
        }
        
        container.register(GradientLoadingStatusBarViewController.self) { r in
            GradientLoadingStatusBarViewController(withViewModel: r.resolve(GradientLoadingStatusBarViewModel.self)!)
        }
        
        container.register(GradientLoadingStatusBarWithSafeAreaViewController.self) { r in
            GradientLoadingStatusBarWithSafeAreaViewController(withViewModel: r.resolve(GradientLoadingStatusBarWithSafeAreaViewModel.self)!)
        }
    }
    
    private func registerNativeNetworkingScreens() {
        // Services
        container.register(HeroListService.self) { r in
            HeroListService(marvelAPIClient: r.resolve(MarvelAPIClient.self)!)
        }
        container.register(HeroDetailService.self) { r in
            HeroDetailService(marvelAPIClient: r.resolve(MarvelAPIClient.self)!)
        }
        container.register(HeroSearchService.self) { r in
            HeroSearchService(marvelAPIClient: r.resolve(MarvelAPIClient.self)!)
        }
        
        // ViewModel
        container.register(HeroListViewModel.self) { r in
            // TODO: make it work with favorited closures.
            //        heroDetailViewModel.favorited.bind { favorited in
            //            favoritedClosure(favorited)
            //        }
            let viewModel = HeroListViewModel(withService: r.resolve(HeroListService.self)!)
            
            viewModel.showHeroSearch = { [unowned self] in
                self.openHeroSearchScreen()
            }
            
            viewModel.showHeroDetail = { [unowned self] heroId in
                self.openHeroDetailScreen(withHeroId: heroId)
            }
            return viewModel
        }
        container.register(HeroDetailViewModel.self) { r in
            HeroDetailViewModel(withService: r.resolve(HeroDetailService.self)!)
        }
        container.register(HeroDetailViewModel.self) { r in
            HeroDetailViewModel(withService: r.resolve(HeroDetailService.self)!)
        }
        container.register(HeroSearchViewModel.self) { r in
            HeroSearchViewModel(withService: r.resolve(HeroSearchService.self)!)
        }
        
        // ViewControllers
        container.register(HeroListViewController.self) { r in
            HeroListViewController(withViewModel: r.resolve(HeroListViewModel.self)!)
        }
        container.register(HeroDetailViewController.self) { r in
            HeroDetailViewController(withViewModel: r.resolve(HeroDetailViewModel.self)!)
        }
        container.register(HeroSearchViewController.self) { r in
            HeroSearchViewController(withViewModel: r.resolve(HeroSearchViewModel.self)!)
        }
    }
    
    private func registerEmptyDataSetScreens() {
        // ViewModels
        container.register(MainEmptyDataSetListViewModel.self) { r in
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
            return viewModel
        }
        
        // ViewControllers
        container.register(MainEmptyDataSetListViewController.self) { r in
            MainEmptyDataSetListViewController(withViewModel: r.resolve(MainEmptyDataSetListViewModel.self)!)
        }
        container.register(EmptyDataSetListViewController.self) { _ in
            EmptyDataSetListViewController()
        }
        container.register(EmptyDataSetListWithButtonViewController.self) { _ in
            EmptyDataSetListWithButtonViewController()
        }
        container.register(EmptyDataSetListWithImageViewController.self) { _ in
            EmptyDataSetListWithImageViewController()
        }
    }
    
    private func registerMainScreen() {
        // Services
        container.register(MainService.self) { r in MainService(marvelAPIClient: r.resolve(MarvelAPIClient.self)!,
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
            
            viewModel.showStretchyHeaderScreens = { [unowned self] in
                self.openMainStretchyHeaderViewController()
            }

            viewModel.showSwiftUIScreens = { [unowned self] in
                self.openSwiftUIScreens()
            }
            
            return viewModel
        }
        
        // ViewController
        container.register(MainViewController.self) { r in MainViewController(withViewModel: r.resolve(MainViewModel.self)!)}
    }
    
    private func registerRxSwiftScreens() {
        // Services
        container.register(ReposService.self) { r in
            ReposService(githubAPIClient: r.resolve(AlamofireHTTPClient.self)!)
        }
        
        // ViewModels
        container.register(ReposViewModel.self) { r in
            ReposViewModel(service: r.resolve(ReposService.self)!)
        }
        // ViewControllers
        container.register(ReposViewController.self) { r in
            ReposViewController(viewModel: r.resolve(ReposViewModel.self)!)
        }
    }
    
    private func registerStretchyHeaderScreens() {
        // ViewControllers
        container.register(MainStretchyHeaderViewController.self) { r in
            MainStretchyHeaderViewController(viewModel: r.resolve(ReposViewModel.self)!)
        }
    }

    private func registerSwiftUIScreens() {
        // Views
        container.register(ContentView.self) { r in
            ContentView()
        }
    }
}


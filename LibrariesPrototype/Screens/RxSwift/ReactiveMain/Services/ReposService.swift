//
//  MainService.swift
//  testiOSOzgunEmreZor
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ReposServiceProtocol {
    func getRepos() -> Observable<[Repository]>
//    func getReposMore() -> Observable<[Repository]>
}

class ReposService: LTService, ReposServiceProtocol {
    
    let limit: Int = 10
    var offset: Int = 0

    private static var sharedNetworkManager: ReposService = {
        let networkManager = ReposService()
        return networkManager
    }()
    
    // MARK: - Accessors
    
    class func shared() -> ReposService {
        return sharedNetworkManager
    }
    
    // MARK: - Services

//    func getRepos() -> Observable<[Repository]> {
//        return client.request(GithubAPI.getFlyingBearPublicReposMore()).asObservable()
//    }
//
    func getRepos() -> Observable<[Repository]> {
        return githubAPIClient.request(GithubAPI.getFlyingBearPublicReposMore(limit: limit, offset: offset)).asObservable()
    }
    
    

}

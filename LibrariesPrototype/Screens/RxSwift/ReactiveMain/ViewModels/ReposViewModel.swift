//
//  ReposViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation
import RxSwift

class ReposViewModel: LTRXViewModel {
    
    // MARK: - Variables
    public let repositoryViewModels: Variable<[RepositoryViewModel]> = Variable([])

    internal var service: ReposServiceProtocol?
    
    // MARK: - Init
    init(service: ReposServiceProtocol = ReposService.shared()) {
        self.service = service
    }
    
    // MARK: - Service Calls
    func getRepos() {
        self.loading.onNext(true)
        guard let service = service else {
            self.error.onNext(.internalError("Service is not initilized correctly"))
            self.loading.onNext(false)
            return
        }
        service.getRepos().bind { [weak self] repos in
            let viewModels = self?.getRepositoryViewModels(with: repos)
            self?.repositoryViewModels.value = viewModels ?? []
            self?.loading.onNext(false)
        }.disposed(by: disposeBag)
    }
    
//    func getReposMore() {
//        self.loading.onNext(true)
//        guard let service = service else {
//            self.error.onNext(.internalError("Service is not initilized correctly"))
//            self.loading.onNext(false)
//            return
//        }
//        service.getReposMore().bind { [weak self] repos in
//            let viewModels = self?.getRepositoryViewModels(with: repos)
//            self?.repositoryViewModels.value += viewModels ?? []
//            self?.loading.onNext(false)
//            }.disposed(by: disposeBag)
//    }
    
    // MARK: - Helper Methods
    
    func getRepositoryViewModels(with repos:[Repository]) -> [RepositoryViewModel] {
        return repos.map({ repo -> RepositoryViewModel in
            RepositoryViewModel(repoModel: repo)
        })
    }
}

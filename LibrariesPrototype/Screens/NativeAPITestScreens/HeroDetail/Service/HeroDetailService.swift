//
//  HeroDetailService.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

let kRequiredCountForDetails = 3

class HeroDetailService: BaseService {
    func getHeroComics(with heroId: Int, completion: @escaping (Result<[Comic], Error>) -> Void) {
        print("\nGetHeroComics starting:")
        marvelAPIClient.send(GetHeroComics(heroId: heroId, limit: HeroDetailServiceConstants.requiredDetailCount)) { response in
            print("\nGetHeroComics finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getHeroEvents(with heroId: Int, completion: @escaping (Result<[Event], Error>) -> Void) {
        print("\nGetHeroEvents starting:")
        marvelAPIClient.send(GetHeroEvents(heroId: heroId, limit: HeroDetailServiceConstants.requiredDetailCount)) { response in
            print("\nGetHeroEvents finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getHeroSeries(with heroId: Int, completion: @escaping (Result<[Serie], Error>) -> Void) {
        print("\nGetHeroSeries starting:")
        marvelAPIClient.send(GetHeroSeries(heroId: heroId, limit: HeroDetailServiceConstants.requiredDetailCount)) { response in
            print("\nGetHeroSeries finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getHeroStories(with heroId: Int, completion: @escaping (Result<[Story], Error>) -> Void) {
        print("\nGetHeroStories starting:")
        marvelAPIClient.send(GetHeroStories(heroId: heroId, limit: HeroDetailServiceConstants.requiredDetailCount)) { response in
            print("\nGetHeroStories finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

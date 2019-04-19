//
//  HeroListService.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

class HeroListService: BaseService {
    
    var offset = 0
    let limit = 20
    
    func getHeros(completion: @escaping (Result<[ComicCharacter], Error>) -> Void) {
        print("\nGetCharacters starting:")
        marvelAPIClient.send(GetCharacters()) { response in
            print("\nGetCharacters finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMoreHeros(completion: @escaping (Result<[ComicCharacter], Error>) -> Void) {
        print("\nGetCharactersMore starting:")
        offset += limit
        marvelAPIClient.send(GetCharacters(limit: limit, offset: offset)) { response in
            print("\nGetCharactersMore finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}

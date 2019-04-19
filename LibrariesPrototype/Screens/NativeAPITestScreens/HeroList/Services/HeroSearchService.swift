//
//  HeroSearchService.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/8/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroSearchService: BaseService {

    func getHeros(with name: String, completion: @escaping (Result<[ComicCharacter], Error>) -> Void) {
        print("\ngetHeroswithName starting:")
        marvelAPIClient.send(GetCharacters(nameStartsWith: name)) { response in
            print("\ngetHerosWithName finished:")
            switch response {
            case .success(let dataContainer):
                completion(.success(dataContainer.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

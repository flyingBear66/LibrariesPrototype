//
//  Repository.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

final class Repository: Decodable {
    let name: String
    let description: String?
    let fork: Bool
    let owner: Owner
    
    init(name: String, description: String, fork: Bool, owner: Owner) {
        self.name = name
        self.description = description
        self.fork = fork
        self.owner = owner
    }
}

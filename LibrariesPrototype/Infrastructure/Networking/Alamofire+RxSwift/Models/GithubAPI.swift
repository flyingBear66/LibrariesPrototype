//
//  GithubAPI.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

enum GithubAPI {}

extension GithubAPI {
    
    static func getFlyingBearPublicRepos() -> Endpoint<[Repository]> {
        return Endpoint(path: "users/flyingBear66/repos")
    }
    
    static func getFlyingBearPublicReposMore(limit: Int, offset: Int) -> Endpoint<[Repository]> {
        return Endpoint(path: "users/flyingBear66/repos", parameters: ["limit": limit, "offset": offset])
    }
}

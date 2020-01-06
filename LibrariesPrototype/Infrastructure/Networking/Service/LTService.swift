//
//  LTService.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

class LTService {
    let marvelAPIClient: MarvelAPIClient
    let githubAPIClient: AlamofireHTTPClient
    
    init(marvelAPIClient: MarvelAPIClient = MarvelAPIClient(publicKey: "8b588a7a6c43e67b5a8baea03512f8db",
                                                            privateKey: "c1fdb043e31867a447e8b1cb9232e649ae7ebf8f"),
         githubAPIClient: AlamofireHTTPClient = AlamofireHTTPClient()) {
        self.marvelAPIClient = marvelAPIClient
        self.githubAPIClient = githubAPIClient
    }
}

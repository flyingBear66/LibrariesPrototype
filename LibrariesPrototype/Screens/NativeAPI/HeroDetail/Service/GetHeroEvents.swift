//
//  GetHeroEvents.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

public struct GetHeroEvents: APIRequest {
    public typealias Response = [Event]
    
    public var resourceName: String {
        return "characters/\(characterId)/events"
    }
    
    // Parameters
    private let characterId: Int
    public let limit: Int?

    // Note that nil parameters will not be used
    public init(heroId: Int, limit: Int? = nil) {
        self.limit = limit
        self.characterId = heroId
    }
}

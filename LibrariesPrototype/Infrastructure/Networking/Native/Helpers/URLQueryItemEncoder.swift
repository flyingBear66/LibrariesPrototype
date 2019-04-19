//
//  URLQueryItemEncoder.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//
//  This API and Model related coded are taken from "https://github.com/victorpimentel/MarvelAPI" repo.
//

import Foundation

/// Encodes any encodable to a URLQueryItem list
enum URLQueryItemEncoder {
    static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
        let parametersData = try encodable.encoded()
        let parameters = try parametersData.decoded() as [String: HTTPParameter]
        return parameters.map { URLQueryItem(name: $0, value: $1.description) }
    }
}

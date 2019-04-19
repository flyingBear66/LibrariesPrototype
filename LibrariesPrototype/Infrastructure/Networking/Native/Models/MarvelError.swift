//
//  MarvelError.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//
//  This API and Model related coded are taken from "https://github.com/victorpimentel/MarvelAPI" repo.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum MarvelError: Error {
    case encoding
    case decoding
    case server(message: String)
}

//
//  Event.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

public struct Event: Decodable {
    public let id: Int
    public let title: String?
    public let description: String?
}

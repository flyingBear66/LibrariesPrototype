//
//  ComicCharacter.swift
//  LibrariesPrototype
//
//  This API and Model related coded are taken from "https://github.com/victorpimentel/MarvelAPI" repo.

import Foundation

public struct ComicCharacter: Decodable {
    public let id: Int
    public let name: String?
    public let description: String?
    public let thumbnail: Image?
}

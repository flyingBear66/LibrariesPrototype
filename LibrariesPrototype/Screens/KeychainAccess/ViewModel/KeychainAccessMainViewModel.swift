//
//  KeychainAccessMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainAccessMainViewModel: LTViewModel {

    let keychainItems: Bindable<[String]> = Bindable<[String]>([])
    
    override init() {
        super.init()
        setupKeychain()
    }
    
    // MARK: Public
    public func getKeychainItems() {
        keychainItems.value = fetchKeychainItems()
    }
    
    // MARK: Helpers
    
    private func fetchKeychainItems() -> [String] {
        let keychain = Keychain(service: "com.ozgunzor.LibrariesPrototype")
        var keychainItems = [String]()
        
        let items = keychain.allItems()
        for item in items {
            keychainItems.append("Key: \(item["key"] ?? "nil"), Value: \(item["value"] ?? "nil")")
        }
        return keychainItems
    }
    
    private func setupKeychain() {
        let keychain = Keychain(service: "com.ozgunzor.LibrariesPrototype")
        keychain["itemKey1"] = "itemValue1"
        keychain["itemKey2"] = "itemValue2"
    }
    
    deinit {
        let keychain = Keychain(service: "com.ozgunzor.LibrariesPrototype")
        keychain["itemKey1"] = nil
        keychain["itemKey2"] = nil
    }
    
}

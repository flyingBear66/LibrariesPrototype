//
//  EnvironmentInfoHelper.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 25/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

struct EnvironmentInfoHelper {
    
    private var nsDictionary: NSDictionary

    var environment: String {
        if let environmentName = nsDictionary[EnvironmentInfoConstants.environment] as! String? {
            return environmentName
        }
        return "N/a"
    }
    
    init() {
        nsDictionary = EnvironmentInfoHelper.getInfoPlist() ?? [:]
    }

    private static func getInfoPlist() -> NSDictionary? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
}

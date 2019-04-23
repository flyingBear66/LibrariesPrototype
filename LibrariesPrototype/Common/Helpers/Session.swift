//
//  Session.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

class Session {

    // MARK: - Accessors
    var currentViewController: LTViewController?

    // MARK: - Accessors
    public static var shared: Session = {
        let sharedSession = Session()
        return sharedSession
    }()

}

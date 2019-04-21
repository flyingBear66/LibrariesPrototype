//
//  Owner.swift
//  testiOSOzgunEmreZor
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

final class Owner: Decodable {
    let login: String?
    
    init(login: String) {
        self.login = login
    }
}

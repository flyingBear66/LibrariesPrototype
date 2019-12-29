//
//  HeroEventViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroEventViewModel: LTViewModel {
    // MARK: - Variables
    private let event: Event
    public let title: String
    public let eventDescription: String
    
    // MARK: - Init
    init(event: Event) {
        self.event = event
        self.title = event.title ?? EmptyStateStrings.heroDetail
        if let eventDescription = event.description {
            self.eventDescription = eventDescription.isEmpty ? EmptyStateStrings.heroDetail : eventDescription
        } else {
            self.eventDescription = EmptyStateStrings.heroDetail
        }
    }
}

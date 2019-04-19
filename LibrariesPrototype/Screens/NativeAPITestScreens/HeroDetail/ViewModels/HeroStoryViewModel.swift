//
//  HeroStoryViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroStoryViewModel: LTViewModel {

    // MARK: - Variables
    private let story: Story
    public let title: String
    public let storyDescription: String
    
    // MARK: - Init
    init(story: Story) {
        self.story = story
        self.title = story.title ?? EmptyStateStrings.heroDetail
        if let storyDescription = story.description {
            self.storyDescription = storyDescription.isEmpty ? EmptyStateStrings.heroDetail : storyDescription
        } else {
            self.storyDescription = EmptyStateStrings.heroDetail
        }
    }
    
}

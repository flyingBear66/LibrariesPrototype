//
//  HeroDetailViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroDetailViewModel: LTViewModel {
    
    // MARK: - Variables
    private let service: HeroDetailService!
    public var heroDetailDidError = Bindable<String>("")
    public var comicViewModels = Bindable<[HeroComicViewModel]>([])
    public var eventViewModels = Bindable<[HeroEventViewModel]>([])
    public var serieViewModels = Bindable<[HeroSerieViewModel]>([])
    public var storyViewModels = Bindable<[HeroStoryViewModel]>([])
    public var favorited = Bindable<Bool>(false)
    public var favoritedDetail = Bindable<Bool>(false)
    private var comicsLoaded = Bindable<Bool>(false)
    private var eventsLoaded = Bindable<Bool>(false)
    private var seriesLoaded = Bindable<Bool>(false)
    private var storiesLoaded = Bindable<Bool>(false)

    private var heroId: Int = 0
    
    // MARK: - Init
    
    init(withService service: LTService, heroId id: Int) {
        self.service = (service as! HeroDetailService)
        self.heroId = id
        favorited.value = UserDefaults.standard.bool(forKey: "\(heroId)")
        favoritedDetail.value = UserDefaults.standard.bool(forKey: "\(heroId)")
    }
    
    // MARK: - Public Methods
    func favoriteTapped() {
        UserDefaults.standard.set(!favorited.value, forKey: "\(heroId)")
        //To Notify Hero List
        favorited.value = UserDefaults.standard.bool(forKey: "\(heroId)")
        //To Notify Hero Detail
        favoritedDetail.value = UserDefaults.standard.bool(forKey: "\(heroId)")
    }
    
    // MARK: - Services
    func getHeroDetail() {
        comicsLoaded.bind { [weak self] _ in
            self!.checkAllDatasLoaded()
        }
        eventsLoaded.bind { [weak self] _ in
            self!.checkAllDatasLoaded()
        }
        seriesLoaded.bind { [weak self] _ in
            self!.checkAllDatasLoaded()
        }
        storiesLoaded.bind { [weak self] _ in
            self!.checkAllDatasLoaded()
        }
        
        loading.value = true
        self.service.getHeroComics(with: heroId) { result in
            self.comicsLoaded.value = true
            switch result {
            case .success(let comics):
                self.comicViewModels.value = self.getViewModels(with: comics)
            case .failure(let error):
                self.heroDetailDidError.value = error.localizedDescription
            }
        }
        self.service.getHeroEvents(with: heroId) { result in
            self.eventsLoaded.value = true
            switch result {
            case .success(let events):
                self.eventViewModels.value = self.getViewModels(with: events)
            case .failure(let error):
                self.heroDetailDidError.value = error.localizedDescription
            }
        }
        self.service.getHeroSeries(with: heroId) { result in
            self.seriesLoaded.value = true
            switch result {
            case .success(let series):
                self.serieViewModels.value = self.getViewModels(with: series)
            case .failure(let error):
                self.heroDetailDidError.value = error.localizedDescription
            }
        }
        self.service.getHeroStories(with: heroId) { result in
            self.storiesLoaded.value = true
            switch result {
            case .success(let stories):
                self.storyViewModels.value = self.getViewModels(with: stories)
            case .failure(let error):
                self.heroDetailDidError.value = error.localizedDescription
            }
        }
    }
    
    // MARK: - Helpers
    
    func checkAllDatasLoaded() {
        if comicsLoaded.value && eventsLoaded.value &&
            seriesLoaded.value && storiesLoaded.value {
            loading.value = false
        }
    }
    
    func getViewModels(with comics: [Comic]) -> [HeroComicViewModel] {
        return comics.map({ comic -> HeroComicViewModel in
            HeroComicViewModel(comic: comic)
        })
    }
    
    func getViewModels(with events: [Event]) -> [HeroEventViewModel] {
        return events.map({ event -> HeroEventViewModel in
            HeroEventViewModel(event: event)
        })
    }
    
    func getViewModels(with series: [Serie]) -> [HeroSerieViewModel] {
        return series.map({ serie -> HeroSerieViewModel in
            HeroSerieViewModel(serie: serie)
        })
    }
    
    func getViewModels(with stories: [Story]) -> [HeroStoryViewModel] {
        return stories.map({ story -> HeroStoryViewModel in
            HeroStoryViewModel(story: story)
        })
    }

}

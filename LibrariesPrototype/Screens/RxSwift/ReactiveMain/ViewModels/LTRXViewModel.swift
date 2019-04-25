//
//  LTRXViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import RxSwift

public enum HomeError {
    case internalError(String)
    case serverError(String)
}

class LTRXViewModel: NSObject {
    public let error: PublishSubject<HomeError> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let disposeBag = DisposeBag()
}


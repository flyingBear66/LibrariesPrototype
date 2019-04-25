//
//  Bindable.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//
// This is a type which I am inspried a code piecee from my previous company.
// This is so simplified version of this to make simple reactive approach.

import Foundation

class Bindable<T> {
    
    typealias CallBack = (T) -> ()
    
    var callback: CallBack?
    
    var value: T {
        didSet {
            callback?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(_ callback: CallBack?) {
        self.callback = callback
    }
    
    func bindAndFire(_ callback: CallBack?) {
        self.callback = callback
        callback?(value)
    }
    
}

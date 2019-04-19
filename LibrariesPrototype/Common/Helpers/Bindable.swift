//
//  Bindable.swift
//  MarvelAPIAppZor
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//
// This is a type which I am inspried a code piecee from my previous company.
// This is so simplified version of this to make simple reactive approach.

import Foundation

class Bindable<T> {
    
    typealias CallBack = (T) -> ()
    // Callback adında herhangi bir veriable türünde data alıp void dönen function değişkeni tipi.
    
    var callback: CallBack?
    // Üstte oluşturduğumuz tipte bir değişken olşturduk.
    
    var value: T {
        didSet {
            callback?(value)
        }
    }
    // irdelediğimiz data değiştiğinde swift'in didSet metodu ile yeni value callback edilir.
    
    init(_ v: T) {
        value = v
    }
    // Callback edilebilir değişkenimizi init ederek ilk valuesini atıyoruz.
    
    func bind(_ callback: CallBack?) {
        self.callback = callback
    }
    // ViewController da değişiklik olduğunda cevabın düşeceği functionu atıyoruz.
    
    func bindAndFire(_ callback: CallBack?) {
        self.callback = callback
        callback?(value)
    }
    // ViewController da değişiklik olduğunda cevabın düşeceği functionu atıyoruz ve o değişkeni çalıştırıyoruz
    
}



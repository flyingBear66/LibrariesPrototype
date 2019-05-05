//
//  UIImageView+AlamofireImage.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 05/05/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    public func zor_setImageWith(_ urlString: String) {
        if let url = URL(string: urlString) {
            self.zor_setImageWith(url)
        }
    }
    
    public func zor_setRoundedImageWith(_ urlString: String) {
        if let url = URL(string: urlString) {
            self.zor_setRoundedImageWith(url)
        }
    }
    
    public func zor_setBlurredImageWith(_ urlString: String) {
        if let url = URL(string: urlString) {
            self.zor_setBlurredImageWith(url)
        }
    }
    
    public func zor_setImageHasRadiusWith(_ urlString: String, cornerRadius: CGFloat) {
        if let url = URL(string: urlString) {
            self.zor_setImageHasRadiusWith(url, cornerRadius: cornerRadius)
        }
    }
    
    public func zor_setImageHasOptionsWith(_ urlString: String, cornerRadius: CGFloat, blurRadius: UInt) {
        if let url = URL(string: urlString) {
            self.zor_setImageHasOptionsWith(url, cornerRadius: cornerRadius, blurRadius: blurRadius)
        }
    }
    
    public func zor_setImageHasFilterArrayWith(_  urlString: String, imageFilterArray filterArray: [ImageFilter]) {
        if let url = URL(string: urlString) {
            self.zor_setImageHasFilterArrayWith(url, imageFilterArray: filterArray)
        }
    }
    
    // MARK: - with URL
    
    public func zor_setImageWith(_ url: URL) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: nil,
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
    
    public func zor_setRoundedImageWith(_ url: URL) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: CircleFilter(),
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
    
    public func zor_setBlurredImageWith(_ url: URL) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: BlurFilter(blurRadius: 5),
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
    
    public func zor_setImageHasRadiusWith(_ url: URL, cornerRadius: CGFloat) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: RoundedCornersFilter(radius: cornerRadius),
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
    
    public func zor_setImageHasOptionsWith(_ url: URL, cornerRadius: CGFloat, blurRadius: UInt) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: DynamicCompositeImageFilter([BlurFilter(blurRadius: blurRadius), RoundedCornersFilter(radius: cornerRadius)]),
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
    
    public func zor_setImageHasFilterArrayWith(_ url: URL, imageFilterArray filterArray: [ImageFilter]) {
        self.af_setImage(withURL: url,
                         placeholderImage: nil,
                         filter: DynamicCompositeImageFilter(filterArray),
                         progress: nil,
                         progressQueue: DispatchQueue.main,
                         imageTransition: .crossDissolve(0.3),
                         runImageTransitionIfCached: false,
                         completion: nil)
    }
}

//
//  UIImageView+AsyncLoadingFromURL.swift
//  MarvelAPIAppZor
//
// This code is inspried from the code snippet from the below link
// https://stackoverflow.com/questions/37018916/swift-async-load-image

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {

        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            return
        }

        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error?.localizedDescription ?? "Unknown error")")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}

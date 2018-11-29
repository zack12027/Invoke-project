//
//  Library.swift
//  MindFull
//
//  Created by Weng Seong Cheang on 11/27/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject,AnyObject>()
let jsonCache = NSCache<AnyObject,AnyObject>()

// Define jsonUrlString for parseData to return results, jsonCache can only be used if the API do not change in data at the moment, unless future implementation for caching by ID

class Library {
    
    func parseData(_ completion: @escaping (NSArray) -> ()) {
        guard let url = URL(string: jsonUrlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return  }
            do {
                if let pintrests = try? JSONDecoder().decode([Pintrest].self, from: data){
                    let results = pintrests as NSArray
                    jsonCache.setObject(pintrests as AnyObject, forKey: jsonUrlString as AnyObject)
                    completion(results)
                    }
                }
            }
        task.resume()
        
    }
    // ParseImages will take in the URL of which the image is stored and store the Image in imageCache for usability, will save the cache under the name of the url given
    
    func parseImages(ImagesUrlArrayPath: String, completion: @escaping (UIImage)-> Void) {
        if let imageFromCache = imageCache.object(forKey: ImagesUrlArrayPath as AnyObject ) as? UIImage {
            completion(imageFromCache)
        }
        else
        {
        if let imageURL = URL(string: (ImagesUrlArrayPath)){
            DispatchQueue.global().async{
                let data = try? Data(contentsOf: imageURL)
                if let data = data{
                    let imageToCache = UIImage(data: data)
//                    let image = imageToCache
                    DispatchQueue.main.async {
                        imageCache.setObject(imageToCache!, forKey: ImagesUrlArrayPath as AnyObject)
                        completion(imageToCache!)
                        //cell?.videoImageView.image = image //?.resizeImage(targetSize: size)
                        }
                    }
                }
            }
        }
    }
    
    
}


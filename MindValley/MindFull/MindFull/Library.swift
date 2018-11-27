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
//Allows userdefaults
let userDefaults = UserDefaults.standard


class Library {
    
    func parseData() -> [Pintrest] {
        
        let jsonUrlString = "http://pastebin.com/raw/wgkJgazE"
        guard let url = URL(string: jsonUrlString) else { return pintrest }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return  }
            do {
                if let pintrests = try? JSONDecoder().decode([Pintrest].self, from: data){
                    pintrest = pintrests
                    //print(pintrest)
                   DispatchQueue.main.async {
                    
                    print(pintrest)
                    
                   }
                }
            }
        }
        task.resume()
        return pintrest
    }
    
    func parseImages(ImagesUrlArrayPath: String){
        if let imageURL = URL(string: (ImagesUrlArrayPath)){
            DispatchQueue.global().async{
                let data = try? Data(contentsOf: imageURL)
                if let data = data{
                    let imageToCache = UIImage(data: data)
//                    let image = imageToCache
                    DispatchQueue.main.async {
                        imageCache.setObject(imageToCache!, forKey: ImagesUrlArrayPath as AnyObject)
                        //cell?.videoImageView.image = image //?.resizeImage(targetSize: size)
                        
                    }
                }
            }
        }
    
    }
    
    
}


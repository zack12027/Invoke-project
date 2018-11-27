//
//  ViewController.swift
//  MindFull
//
//  Created by Weng Seong Cheang on 11/27/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit

var pintrest = [Pintrest]()
let cellReuseIdentifier = "custom"

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseData()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.tableFooterView = UIView()
        TableView.reloadData()
        print(pintrest)
        //Library().parseImages(ImagesUrlArrayPath: <#T##String#>)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(pintrest.count)
        return pintrest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CustomCell
        let pintrestsUrl = pintrest[indexPath.row].urls?.thumb
        //print(pintrestsUrl)
        //Library().parseImages(ImagesUrlArrayPath: pintrestsUrl!)
        if let imageFromCache = imageCache.object(forKey: pintrestsUrl as AnyObject ) as? UIImage {
            cell?.ImageView.image = imageFromCache
            return (cell)!
        }
        
        
        
        if let imageURL = URL(string: (pintrestsUrl!)){
            DispatchQueue.global().async{
                let data = try? Data(contentsOf: imageURL)
                if let data = data{
                    let imageToCache = UIImage(data: data)
                    let image = imageToCache
                    DispatchQueue.main.async {
                        imageCache.setObject(imageToCache!, forKey: pintrestsUrl! as AnyObject)
                        cell?.ImageView.image = image
                        
                    }
                }
            }
        }
        
        return cell!
    }
    
    func parseData(){
        
        let jsonUrlString = "http://pastebin.com/raw/wgkJgazE"
        guard let url = URL(string: jsonUrlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                if let pintrests = try? JSONDecoder().decode([Pintrest].self, from: data){
                    pintrest = pintrests
                    DispatchQueue.main.async {
                        self.TableView.reloadData()
                    }
                    
                    
                    
                    
                }
            }
        }
        task.resume()
    }
    
    func parseImages(ImagesUrlArrayPath: String){
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    
    }
    


}


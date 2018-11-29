//
//  ViewController.swift
//  MindFull
//
//  Created by Weng Seong Cheang on 11/27/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit

var pintrest = [Pintrest]()
//let jsonCache = NSCache<AnyObject,AnyObject>()
let cellReuseIdentifier = "custom"
let jsonUrlString = "http://pastebin.com/raw/wgkJgazE"
let refreshControl = UIRefreshControl()

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //set TableView delegate to self
        
        
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.tableFooterView = UIView()
        
        // Refresh methods
        
        if #available(iOS 10.0, *) {
            TableView.refreshControl = refreshControl
        } else {
            TableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        // Get the data from the Api and update the TableView
        refreshData(self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pintrest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Update individual cell with retrieve data and images
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CustomCell
        let pintrestsUrl = pintrest[indexPath.row].urls?.thumb
        cell?.ImageView.image = nil
        Library().parseImages(ImagesUrlArrayPath: pintrestsUrl!, completion: { (image) -> Void in
            if let imageFromCache = imageCache.object(forKey: pintrestsUrl as AnyObject ) as? UIImage {
                cell?.ImageView.image = imageFromCache
            }
        })
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    }
    
    @objc private func refreshData(_ sender: Any) {
        Library().parseData { (array) in
            pintrest = array as! [Pintrest]
            print(pintrest.count)
            
            DispatchQueue.main.async {
                self.TableView.reloadData()
                refreshControl.endRefreshing()
                
            }
        }
        
    }


}


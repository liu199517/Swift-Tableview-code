//
//  SecondViewController.swift
//  点击cell跳转Plain效果
//
//  Created by Liu&Jewel on 2020/9/28.
//  Copyright © 2020 Liu&Jewel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {  
    
    var secTableViews : UITableView!
    
    var PassDataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secTableViews = UITableView(frame: .zero, style: .plain)
        secTableViews.frame = view.bounds
        secTableViews.delegate = self
        secTableViews.dataSource = self
        secTableViews.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = UIColor.MyColor(R: 240, G: 240, B: 240, A: 1)
        view.addSubview(secTableViews)
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return PassDataArray.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PassDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = PassDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

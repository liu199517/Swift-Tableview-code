//
//  ViewController.swift
//  点击cell跳转Plain效果
//
//  Created by Liu&Jewel on 2020/9/28.
//  Copyright © 2020 Liu&Jewel. All rights reserved.
//

import UIKit

struct Models {
    var sectionTitle: String?
    var rowTitle: [String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var MyTableviews : UITableView!
    
    var myModels = [
        (Models(sectionTitle: "通用", rowTitle: ["设置","隐私"])),
        (Models(sectionTitle: "模式", rowTitle: ["系统","暗黑"])),
        (Models(sectionTitle: "清除缓存", rowTitle: ["聊天记录"]))
    ]
    
    var setA = ["A","B","C"]
    var setB = ["1","2","3"]
    var setC = ["hello","hallo"]
    var setD = ["跟随系统"]
    var setE = ["清除聊天记录","备份记录"]
    var setF = ["哈哈","呵呵"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableviews = UITableView(frame: .zero, style: .grouped)
        
        MyTableviews.delegate = self
        MyTableviews.dataSource = self
        MyTableviews.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        MyTableviews.frame = self.view.bounds
        MyTableviews.backgroundColor = UIColor.MyColor(R: 250, G: 250, B: 250, A: 1)
        self.view.addSubview(MyTableviews)
        view.backgroundColor = UIColor.MyColor(R: 250, G: 250, B: 250, A: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return myModels[section].sectionTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModels[section].rowTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(myModels[indexPath.section].rowTitle[indexPath.row])s\(indexPath.section)r\(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = SecondViewController()
        if indexPath.section == 0 && indexPath.row == 1 {
            vc.PassDataArray.append(contentsOf: setA)
        } else if indexPath.section == 0 && indexPath.row == 0  {
            vc.PassDataArray.append(contentsOf: setB)
        } else if indexPath.section == 0 && indexPath.row == 1  {
            vc.PassDataArray.append(contentsOf: setC)
        } else if indexPath.section == 1 && indexPath.row == 0  {
            vc.PassDataArray.append(contentsOf: setD)
        } else if indexPath.section == 1 && indexPath.row == 1  {
            vc.PassDataArray.append(contentsOf: setE)
        } else if indexPath.section == 2 && indexPath.row == 0  {
            vc.PassDataArray.append(contentsOf: setF)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



extension UIColor {
    class func MyColor(R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
        return UIColor.init(red: R/255, green: G/255, blue: B/255, alpha: A)
    }
}

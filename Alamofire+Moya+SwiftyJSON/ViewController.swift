//
//  ViewController.swift
//  Alamofire+Moya+SwiftyJSON
//
//  Created by fsc on 2019/3/27.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var channels: Array<JSON> = []
    var channelArray = [Channel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView)
        
        Network.request(.channels, success: { (data) in
            let json = JSON(data)
            self.channels = json["channels"].arrayValue
            for i in 0 ..< self.channels.count {
            let channel = Channel(fromJson: self.channels[i])
            self.channelArray.append(channel)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(self.channelArray)
        }, error: { (code) in
            print(code)
        }) { (error) in
            print(error)
        }
        
//        DouBanProvider.request(.channels) { (result) in
//            if case let .success(response) = result {
//                let data = try? response.mapJSON()
//                let json = JSON(data!)
//                self.channels = json["channels"].arrayValue
//                for i in 0 ..< self.channels.count {
//                    let channel = Channel(fromJson: self.channels[i])
//                    self.channelArray.append(channel)
//                }
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelArray.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let identify:String = "SwiftCell"
            let cell = tableView.dequeueReusableCell(
                withIdentifier: identify, for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = channelArray[indexPath.row].name
            return cell
    }
    
    //显示消息
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}


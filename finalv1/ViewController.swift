//
//  ViewController.swift
//  finalv1
//
//  Created by Test VPN on 03/11/2022.
//

import UIKit
import  Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData(){
        let request = AF.request("https://api.github.com/users")
        request.responseJSON{ (data) in
            print(data)
        }
    }
}


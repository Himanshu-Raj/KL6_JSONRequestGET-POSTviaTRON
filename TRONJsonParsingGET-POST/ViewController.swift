//
//  ViewController.swift
//  TRONJsonParsingGET-POST
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import UIKit
import TRON

class ViewController: UIViewController {
    
    var users = [User]()
    
    let tron = TRON(baseURL: "https://jsonplaceholder.typicode.com/")

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getRequestMade(_ sender: Any) {
        let request: APIRequest<UsersResponse, MyError> = tron.request("users")
        request.perform(withSuccess: { (usersResponse) in
            
            self.users = usersResponse.users
            self.tableView.reloadData()
        }) { (error) in
            print(error.response?.statusCode ?? "Status Code Missing")
            guard let err = error.errorModel else { return }
            
            print(err.isEmpty)
        }
    }
    
    @IBAction func postRequestMade(_ sender: Any) {
        let request: APIRequest<Post, MyError> = tron.request("posts")
        request.method = .post
        request.parameters = ["username": "@Himanshu-Raj", "message": "Try this tutorial of your own..!!"]
        request.perform(withSuccess: { (post) in
            print(post.username)
            print(post.message)
        }) { (error) in
            print(error)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].companyName
        return cell
    }
    
}



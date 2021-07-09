//
//  ViewController.swift
//  Zeetron AI
//
//  Created by Shubham Mittal on 09/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var MyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        MyTable.delegate = self
        MyTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Zeetron AI"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //show the message
        let vc = ChatViewController()
        vc.title = "Zeetron AI"
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

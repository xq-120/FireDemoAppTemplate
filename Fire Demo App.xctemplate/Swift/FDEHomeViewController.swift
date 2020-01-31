//
//  ViewController.swift
//  DemonSwift
//
//  Created by xuequan on 2020/1/30.
//  Copyright © 2020 xuequan. All rights reserved.
//

import UIKit

class FDEHomeViewController: FDEBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var dataList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
        loadData()
    }
    
    func setupSubview() {
        self.navigationItem.title = "首页"
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }

    func loadData() {
        dataList.removeAll()
        
        let situations = ["situation 0 Title", "situation 1 Title", "situation 2 Title"]
        dataList.append(contentsOf: situations)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let title = dataList[indexPath.row]
        cell.textLabel?.text = title
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = FDEDetailViewController.init()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


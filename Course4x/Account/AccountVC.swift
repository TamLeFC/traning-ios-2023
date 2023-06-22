//
//  AccountVC.swift
//  Course4x
//
//  Created by KietKoy on 22/06/2023.
//

import UIKit

class AccountVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let sections:[SettingSection] = [
        SettingSection(items: [SettingItem(icon: "ic_bag", text: "Restore purchased"),
                               SettingItem(icon: "ic_starAccount", text: "Rate us"),
                               SettingItem(icon: "ic_shield", text: "Terms and Privacy policy")]),
        SettingSection(items: [SettingItem(icon: "ic_settings", text: "Setting"),
                               SettingItem(icon: "ic_log-out", text: "Log out")])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        let nib = UINib(nibName: SettingCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SettingCell.identifier)
        tableView.reloadData()
    }
}


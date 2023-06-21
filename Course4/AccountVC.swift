//
//  AccountVC.swift
//  Course4
//
//  Created by KietKoy on 21/06/2023.
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
extension AccountVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        cell.configure(sections[indexPath.section].items[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            return nil
        }
        let footerView = UIView()
        footerView.addBottomBorder(with: UIColor(named: "border"), andWidth: 1)
        footerView.backgroundColor = .clear
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 25 : 0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 25
    }
}
extension AccountVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sections[indexPath.section].items[indexPath.row].text)
    }
}

struct SettingSection {
    let items: [SettingItem]
}

struct SettingItem {
    let icon: String
    let text: String
}

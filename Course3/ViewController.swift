//
//  ViewController.swift
//  Course3
//
//  Created by KietKoy on 20/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var headView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let sections:[SettingSection] = [
        SettingSection(headTitle: "", items: [
            SettingItem(icon: "ic_changeApp", title: "Change App Icon", isShowSwitch: false),
            SettingItem(icon: "ic_radio", title: "App customization", isShowSwitch: false),
            SettingItem(icon: "ic_radio", title: "Dark Mode", isShowSwitch: false),
            SettingItem(icon: "ic_remove", title: "Remove after import", isShowSwitch: false),
        ]),
        SettingSection(headTitle: "Safety", items: [
            SettingItem(icon: "ic_faceId", title: "Face ID", isShowSwitch: true),
            SettingItem(icon: "ic_changePasscode", title: "Change passcode", isShowSwitch: false),
            SettingItem(icon: "ic_fakePasscode", title: "Fake passcode", isShowSwitch: false),
            SettingItem(icon: "ic_breakAlert", title: "Break-in alert", isShowSwitch: false),
        ]),
        SettingSection(headTitle: "Menu", items: [
            SettingItem(icon: "ic_radio", title: "Restore purchare", isShowSwitch: false),
            SettingItem(icon: "ic_radio", title: "Rating", isShowSwitch: false),
        ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIView
        headView.addBottomBorderWithColor(color: UIColor(named: "border")!, height: 1)
        
        //tableView
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: SettingCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SettingCell.identifier)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 64
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "backgroundHeadTitle")
        
        let label = UILabel()
        label.text = sections[section].headTitle
        label.textColor = UIColor(named: "headTitle")
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 13),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        cell.configure(sections[indexPath.section].items[indexPath.row])
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sections[indexPath.section].items[indexPath.row].title)
    }
}

struct SettingSection {
    let headTitle: String
    let items: [SettingItem]
}
struct SettingItem {
    let icon: String
    let title: String
    let isShowSwitch: Bool
}
extension UIView {
    func addBottomBorderWithColor(color: UIColor, height: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - height, width: frame.size.width, height: height)
        layer.addSublayer(border)
    }
}

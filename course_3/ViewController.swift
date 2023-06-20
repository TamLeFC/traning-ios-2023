//
//  ViewController.swift
//  course_3
//
//  Created by Mobile Dev on 20/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [SettingSection] = [
        SettingSection(sectionTitle: "", items: [
        SettingItem(icon: "ic_changeApp", title: "Change App icon", isShowSwitch: false),
        SettingItem(icon: "ic_radio", title: "App customization", isShowSwitch: false),
        SettingItem(icon: "ic_radio", title: "Dark Mode", isShowSwitch: false),
        SettingItem(icon: "ic_remove", title: "Remove after import", isShowSwitch: false)
        ]),
        SettingSection(sectionTitle: "Safety", items: [
            SettingItem(icon: "ic_faceID", title: "Face ID", isShowSwitch: true),
            SettingItem(icon: "ic_changePass", title: "Change passcode", isShowSwitch: false),
            SettingItem(icon: "ic_fakePass", title: "Fake passcode", isShowSwitch: false),
            SettingItem(icon: "ic_breakIn", title: "Break-in alert", isShowSwitch: false)
        ]),
        SettingSection(sectionTitle: "Menu", items: [
            SettingItem(icon: "ic_radio", title: "Restore purchase", isShowSwitch: false),
            SettingItem(icon: "ic_radio", title: "Rating", isShowSwitch: false)
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        cell.configure(sections[indexPath.section].items[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = sections[section].sectionTitle
        if sectionTitle.isEmpty {
            return nil
        }
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64))
        headerView.backgroundColor = UIColor(named: "color_bgHeader")
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 64))
        label.text = sectionTitle
        label.textColor = UIColor(named: "color_header")
        label.font = .systemFont(ofSize: 16, weight: .semibold)
            
        headerView.addSubview(label)
            
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionTitle = sections[section].sectionTitle
        if sectionTitle.isEmpty{
            return 0
        }
        return 64
    }
     
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 0
        }
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(">>>>> \(indexPath)")
    }
}

struct SettingSection{
    var sectionTitle: String
    var items: [SettingItem]
}

struct SettingItem{
    var icon: String
    var title: String
    var isShowSwitch: Bool
}

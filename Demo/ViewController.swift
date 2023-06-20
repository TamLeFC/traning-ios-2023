//
//  ViewController.swift
//  Demo
//
//  Created by Tam Le on 16/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [SettingSection] = [
        SettingSection(title: "Safety", items: [
            SettingItem(icon: "ic_headphone", title: "FaceID", isShowSwitch: true),
            SettingItem(icon: "ic_headphone", title: "Change pass", isShowSwitch: false),
            SettingItem(icon: "ic_headphone", title: "Reset", isShowSwitch: false)
        ]),
        SettingSection(title: "About", items: [
            SettingItem(icon: "ic_headphone", title: "Share", isShowSwitch: false),
            SettingItem(icon: "ic_headphone", title: "Review", isShowSwitch: false),
            SettingItem(icon: "ic_headphone", title: "About", isShowSwitch: true)
        ])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        label.text = sections[section].title
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor(named: "header")
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        cell.configure(sections[indexPath.section].items[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(">>>>> \(indexPath)")
    }
}

struct SettingSection {
    var title: String
    var items: [SettingItem]
}

struct SettingItem {
    var icon: String
    var title: String
    var isShowSwitch: Bool
}

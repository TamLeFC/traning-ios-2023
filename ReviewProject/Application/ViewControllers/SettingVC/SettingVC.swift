//
//  SettingVC.swift
//  ReviewProject
//
//  Created by Mobile Dev 1 on 19/07/2023.
//

import UIKit

class SettingVC: BaseVC<BaseVM> {
    
    @IBOutlet weak var userHearInfoView: UIView!
    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    override func initViews() {
        super.initViews()
        
        userAvatarImageView.cornerRadius = userAvatarImageView.frame.width / 2
    }
    
    override func configureListView() {
        super.configureListView()
        
        setupTableView()
    }
}

extension SettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingSections(rawValue: indexPath.section) else { return }
        
        switch section {
        case .AppGuildline:
            popupAlert(title: AppGuildline(rawValue: indexPath.row)?.description,
                       message: AppGuildline(rawValue: indexPath.row)?.description,
                       actionTitles: ["OK", "Cancel"],
                       actions: [nil, nil])
        case .PersonalSetting:
            popupAlert(title: PersonalSetting(rawValue: indexPath.row)?.description,
                       message: PersonalSetting(rawValue: indexPath.row)?.description,
                       actionTitles: ["OK", "Cancel"],
                       actions: [nil, nil])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingSections(rawValue: section) else { return 0 }
        
        switch section {
        case .AppGuildline:
            return AppGuildline.allCases.count
        case .PersonalSetting:
            return PersonalSetting.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        guard let section = SettingSections(rawValue: indexPath.section) else { return BaseTableViewCell() }
        
        switch section {
        case .AppGuildline:
            cell.configure(AppGuildline(rawValue: indexPath.row)!)
        case .PersonalSetting:
            cell.configure(PersonalSetting(rawValue: indexPath.row)!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView = UIView()
        footerView.backgroundColor = .clear
        if (section != numberOfSections(in: tableView) - 1) {
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
            
            let divider = UIView()
            divider.backgroundColor = UIColor.init(hex: 0x0B0C0D)
            
            footerView.addSubview(divider)
            
            divider.translatesAutoresizingMaskIntoConstraints = false
            divider.leadingAnchor.constraint(equalTo: footerView.leadingAnchor).isActive = true
            divider.trailingAnchor.constraint(equalTo: footerView.trailingAnchor).isActive = true
            divider.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
            divider.heightAnchor.constraint(equalToConstant: 4).isActive = true
        }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 36
    }
}

extension SettingVC {
    private func setupTableView() {
        let nib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
}

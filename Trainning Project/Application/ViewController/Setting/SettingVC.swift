//
//  SettingVC.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import UIKit

class SettingVC: BaseVC<SettingVM> {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureListView() {
        super.configureListView()
        
        tableView.registerCellNib(SettingCell.self)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        if UIDevice.current.orientation.isLandscape {
            tableView.isScrollEnabled = true
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - UITableViewDataSource

extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier,
                                                 for: indexPath) as! SettingCell
        let settingItem = viewModel.settingItemForIndexPath(indexPath: indexPath)
        cell.configureCell(settingItem)
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension SettingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 36
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == viewModel.numberOfSections() - 1 ? 0 : 36
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.addTopBorder(with: UIColor.init(hex: 0x0B0C0D), andWidth: 2)
        headerView.backgroundColor = .clear
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingItem = viewModel.settingItemForIndexPath(indexPath: indexPath)
        showNotificationBanner(title: settingItem.text, icon: settingItem.icon)
    }
}

//MARK: - Update the UI when the screen transitions

extension SettingVC {
    private func updateTableViewLayout() {
        tableView.isScrollEnabled = UIDevice.current.orientation.isLandscape
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        coordinator.animate(alongsideTransition: { [weak self] (_) in
            guard let self = self else { return }
            self.updateTableViewLayout()
        }, completion: nil)
    }
}

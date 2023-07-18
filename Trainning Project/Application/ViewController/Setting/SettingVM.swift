//
//  SettingVM.swift
//  Trainning Project
//
//  Created by KietKoy on 18/07/2023.
//

import Foundation

class SettingVM: BaseVM {
    private let sections: [SettingSection] = [
        SettingSection(items: [SettingItem(icon: "ic_useric_person", text: "Personal Information"),
                               SettingItem(icon: "ic_key", text: "Update password"),
                               SettingItem(icon: "ic_bell", text: "Get notification")]),
        SettingSection(items: [SettingItem(icon: "ic_question_mark", text: "How to use?"),
                               SettingItem(icon: "ic_premium", text: "Go to Premium"),
                               SettingItem(icon: "ic_shield", text: "Privacy policy")])
    ]
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return sections[section].items.count
    }
    
    func settingItemForIndexPath(indexPath: IndexPath) -> SettingItem {
        return sections[indexPath.section].items[indexPath.row]
    }
}

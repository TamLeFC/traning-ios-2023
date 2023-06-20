var sections: [SettingSection] = [
    SettingSection(items: [
        SettingItem(icon: "ic_change_app", title: "Change App icon", isShowSwitch: false),
        SettingItem(icon: "ic_radio", title: "App customization", isShowSwitch: false),
        SettingItem(icon: "ic_radio", title: "Dark Mode", isShowSwitch: false),
        SettingItem(icon: "ic_remove_after_import", title: "Remove after import", isShowSwitch: false),
    ]),
    SettingSection(title: "Safety", items: [
        SettingItem(icon: "ic_face_id", title: "Face ID", isShowSwitch: true),
        SettingItem(icon: "ic_change_passcode", title: "Change passcode", isShowSwitch: false),
        SettingItem(icon: "ic_fake_passcode", title: "Fake passcode", isShowSwitch: false),
        SettingItem(icon: "ic_breakin_alert", title: "Break-in alert", isShowSwitch: false),
    ]),
    SettingSection(title: "Menu", items: [
        SettingItem(icon: "ic_radio", title: "Restore purchase", isShowSwitch: false),
        SettingItem(icon: "ic_radio", title: "Rating", isShowSwitch: false),
    ]),
]

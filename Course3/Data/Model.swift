struct SettingSection {
    var title: String?
    var items: [SettingItem]
}

struct SettingItem {
    var icon: String
    var title: String
    var isShowSwitch: Bool
}

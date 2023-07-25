enum SettingSections: Int, CaseIterable, CustomStringConvertible {
    case PersonalSetting
    case AppGuildline
    
    var description: String {
        
        switch self {
        case .PersonalSetting: return "Personal Setting"
        case .AppGuildline: return "App Guildline"
        }
    }
}

protocol SettingType: CustomStringConvertible {
    
    var description: String { get }
    var icon: String { get }
}

enum PersonalSetting: Int, CaseIterable, SettingType {
    case PersonalInformation
    case UpdatePassword
    case GetNotification
    
    var description: String {
        
        switch self {
        case .PersonalInformation: return "Personal information"
        case .UpdatePassword: return "Update password"
        case .GetNotification: return "Get notification"
        }
    }
    
    var icon: String {
        
        switch self {
        case .PersonalInformation: return "ic_person"
        case .UpdatePassword: return "ic_key"
        case .GetNotification: return "ic_bell"
        }
    }
}

enum AppGuildline: Int, CaseIterable, SettingType {
    case HowToUse
    case GoToPremium
    case PrivacyPolicy
    
    var description: String {
        
        switch self {
        case .HowToUse: return "How to use?"
        case .GoToPremium: return "Go to Premium"
        case .PrivacyPolicy: return "Privacy policy"
        }
    }
    
    var icon: String {
        
        switch self {
        case .HowToUse: return "ic_question"
        case .GoToPremium: return "ic_premium"
        case .PrivacyPolicy: return "ic_shield"
        }
    }
}

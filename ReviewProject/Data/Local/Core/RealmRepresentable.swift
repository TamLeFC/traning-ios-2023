protocol RealmRepresentable {
    associatedtype RealmType: ModelConvertibleType
    
    func asRealm() -> RealmType
    
}

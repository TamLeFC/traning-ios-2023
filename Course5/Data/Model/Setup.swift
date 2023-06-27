import ObjectMapper

struct Setup: Mappable {
    var icon: String = ""

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        icon <- map["icon"]
    }
}

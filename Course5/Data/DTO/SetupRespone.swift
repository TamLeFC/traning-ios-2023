import ObjectMapper

struct SetupResponse: Mappable {
    var data: [Setup] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

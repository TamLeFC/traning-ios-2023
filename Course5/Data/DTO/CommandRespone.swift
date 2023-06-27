import ObjectMapper

struct CommandResponse: Mappable {
    var data: [Category] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

import ObjectMapper

struct Command: Mappable {
    var text: String = ""

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        text <- map["text"]
    }
}

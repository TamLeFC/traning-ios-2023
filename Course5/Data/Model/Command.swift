import ObjectMapper

struct Command: Mappable {
    var text: String = ""
    
    var isFavorited: Bool = false
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        text <- map["text"]
    }
    
    init(_ text: String) {
        self.text = text
    }
}

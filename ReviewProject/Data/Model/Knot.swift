import ObjectMapper

struct Knot: Mappable {
    var id: String = ""
    var title: String = ""
    var description: String = ""
    var preview: String = ""
    var newMedia: [String] = []
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["_id"]
        title <- map["title"]
        description <- map["description"]
        preview <- map["preview"]
        newMedia <- map["newMedia"]
    }
}


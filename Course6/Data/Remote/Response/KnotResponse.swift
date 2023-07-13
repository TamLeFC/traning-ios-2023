import ObjectMapper

struct KnotResponse: Mappable {
    
    var data: [Knot] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
    
}

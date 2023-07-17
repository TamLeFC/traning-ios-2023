import ObjectMapper

struct AddonsResponse: Mappable {
    
    var data: [Addon] = []
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        data <- map[""]
    }
    
}

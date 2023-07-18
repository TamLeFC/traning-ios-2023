import ObjectMapper

struct Addon: Mappable {
    var itemId: String = ""
    var typeId: String = ""
    var categoryId: String = ""
    var itemName: String = ""
    var fileUrl: String = ""
    var imageUrl: String = ""
    var thumbUrl: String = ""
    var authorName: String = ""
    var version: String = ""
    var size: String = ""
    var description: String = ""
    var shortDescription: String = ""
    var hotPriority: String = ""
    var downloadCount: String = ""
    var videoCode: String = ""
    var isVerify: String = ""
    var createTime: String = ""
    var price: String = ""
    
    var isFavorited: Bool = false
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: Map) {
        itemId <- map["item_id"]
        typeId <- map["type_id"]
        categoryId <- map["category_id"]
        itemName <- map["item_name"]
        fileUrl <- map["file_url"]
        imageUrl <- map["image_url"]
        thumbUrl <- map["thumb_url"]
        authorName <- map["author_name"]
        version <- map["version"]
        size <- map["size"]
        description <- map["description"]
        shortDescription <- map["short_description"]
        hotPriority <- map["hot_priority"]
        downloadCount <- map["download_count"]
        videoCode <- map["video_code"]
        isVerify <- map["is_verify"]
        createTime <- map["create_time"]
        price <- map["price"]
    }
}

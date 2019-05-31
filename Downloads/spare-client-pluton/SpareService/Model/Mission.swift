

import Foundation
import ObjectMapper

public struct Mission: ImmutableMappable {
    
    var name : String?
    var type : String?
    var status : String?
    var releaseDate: Date?
    
    public init(map: Map) throws {
        self.name = try map.value("name")
        
    }
    
    static func buildDateTransformer() -> DateFormatterTransform {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return DateFormatterTransform(dateFormatter: dateFormatter)
    }
    
    public mutating func mapping(map: Map) {
        self.name >>> map["name"]
        self.type >>> map["type"]
        self.status >>> map["status"]
        self.releaseDate = try? map.value("releaseDate", using: Mission.buildDateTransformer())
    }
    
    
    init(name: String,releaseDate: Date, type:String, status:String){
        self.name = name
        self.releaseDate = releaseDate
        self.type = type
        self.status = status
    }
    
    
    
}

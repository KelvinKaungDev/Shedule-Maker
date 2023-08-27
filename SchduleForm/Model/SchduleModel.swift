import Foundation

struct SchduleModel : Codable {
    var date : Date
    var name : String
    var comment : String
    var schdules = [SchduleModel]()
}

import Foundation

struct Compact {
    static var schdules = [SchduleModel]()
    static var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Schdule.plist")
    static var schduleSegue = "Schdule"
    static var schduleCell = "Schdule Cell"
    static var homeSegue = "Back"
}

import Foundation
import UIKit

class SchduleViewController : UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var dateTime: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIButton) {
        if let name = name.text, let comment = comment.text {
            let newSchdule = SchduleModel(date: dateTime.date, name: name, comment: comment)
            Compact.schdules.append(newSchdule)
            saveSchdule()
            navigationController?.popToRootViewController(animated: true)
       }
    }

    func saveSchdule() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(Compact.schdules)
            try data.write(to: Compact.filePath!)
        } catch {
            print(error)
        }
    }
}

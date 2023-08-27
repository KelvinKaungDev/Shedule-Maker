import UIKit

class ViewController : UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90.0
        print(Compact.filePath)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }

    @IBAction func create(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "schdule", sender: self)
    }
    
    func loadData() {
        if let data = try? Data(contentsOf: Compact.filePath!) {
            let decoder = PropertyListDecoder()
            do {
                Compact.schdules = try decoder.decode([SchduleModel].self, from: data)
            } catch {
                print(error)
            }

            self.tableView.reloadData()
        }
    }
}

//MARK: - TABLE VIEW AND CELL

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Compact.schdules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Compact.schduleCell, for: indexPath)
        let schdule = Compact.schdules[indexPath.row]
        cell.textLabel?.text = schdule.name
        return cell
    }
}





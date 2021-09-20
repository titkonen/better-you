import UIKit
import CoreData

class DayEntriesViewController: UITableViewController {

    // MARK: Properties
    lazy var coreDataStack = CoreDataStack(modelName: "better-you-datamodel")
    var daysEntity = [DaysEntity]()
    fileprivate let CustomCell:String = "CustomCell"
    
    lazy var paivanMuotoilu: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .medium
      return formatter
    }()
        
    // MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
      super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTableView()
        
        let lataaData: NSFetchRequest<DaysEntity> = DaysEntity.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(DaysEntity.date), ascending: false)
        lataaData.sortDescriptors = [sortDescriptor]

        do {
          daysEntity = try coreDataStack.managedContext.fetch(lataaData)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }
    
    // MARK: FUNCTIONS
    fileprivate func setupTableView() {
        tableView.register(DaysCell.self, forCellReuseIdentifier: CustomCell)
    }

    // MARK: TABLE VIEW DATA SOURCE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysEntity.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! DaysCell ///CASTING as custom cell style
    
        let noteForRow = self.daysEntity[indexPath.row]
        cell.daysData = noteForRow
        
        return cell
    }
    
    ///Push content to Detail ViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let noteDetailController = DaysDetailVC()
      let noteForRow = self.daysEntity[indexPath.row]
      noteDetailController.daysData = noteForRow
      
      navigationController?.pushViewController(noteDetailController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: DELETING
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      guard let contentToRemove = daysEntity[indexPath.row] as? DaysEntity, editingStyle == .delete else {
          return
      }
        
      //when delete is tapped
        daysEntity.remove(at: indexPath.row)

      coreDataStack.managedContext.delete(contentToRemove)
      coreDataStack.saveContext()
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
} // End of Main class

import UIKit
import CoreData

class ListViewController: UIViewController, NSFetchedResultsControllerDelegate {

    // MARK: - IB Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    lazy var coreDataStack = CoreDataStack(modelName: "better-you-datamodel")
    var daysEntity = [DaysEntity]()
    
    lazy var paivanMuotoilu: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .medium
      return formatter
    }()
    
    // MARK: - Add Life Cycle
    override func viewDidLoad() {
      super.viewDidLoad()

      //title = "Diary 2.3"
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DiaryEntity")
//            if let contactFirstName = daysEntity[indexPath.row].text {
//                let predicate = NSPredicate(format: "text = %d",
//                                            argumentArray: [contactFirstName])
//                fetchRequest.predicate = predicate
//            }
//
//            do {
//                if let contacts = try coreDataStack.managedContext.fetch(fetchRequest) as? [DaysEntity],
//                    let selectedContact = contacts.first {
//                    performSegue(withIdentifier: "showDetailView", sender: selectedContact)
//                }
//            } catch {
//                print("No contacts found")
//            }
//    }
    

} // End of Main class

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysEntity.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewControllerCell", for: indexPath)
        guard let showDate = daysEntity[indexPath.row] as? DaysEntity,
          let showDateinList = showDate.date as Date? else {
            return cell
        }
        cell.textLabel?.text = daysEntity[indexPath.row].text
        cell.detailTextLabel?.text = paivanMuotoilu.string(from: showDateinList)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: DELETING
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      guard let contentToRemove = daysEntity[indexPath.row] as? DaysEntity, editingStyle == .delete else {
          return
      }
        
      //when delete is tapped
        daysEntity.remove(at: indexPath.row)

      coreDataStack.managedContext.delete(contentToRemove)
      coreDataStack.saveContext()
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
} // End of Extensions

import CoreData

struct CoreDataManager {
    
    // MARK: PROPERTIES
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "better-you-datamodel")
        container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of stores failed \(err)")
            }
            
        })
        return container
    }()
    
    // MARK: CRUD FUNCTIONS
    // MARK: Create New Day Entry
    func createNewEntry(rate: Int32, date: Date, text: String) -> DaysEntity {
        let context = persistentContainer.viewContext
        let newDayEntry = NSEntityDescription.insertNewObject(forEntityName: "DaysEntity", into: context) as! DaysEntity
        
        //newNote.setValue(title, forKey: "title")
        newDayEntry.rate = rate
        newDayEntry.text = text
        newDayEntry.date = date
        //newDayEntry.noteFolder = noteFolder
        
        do {
            try context.save()
            return newDayEntry
        } catch let error {
            print("Failed to save new note", error)
          return newDayEntry
        }
    }
    
    // MARK: Fetch Notes
//    func fetchEntries(_: DaysEntity) -> [DaysEntity] {
//        guard let dayEntries = days?.allObjects as? [DaysEntity] else {
//            return []
//        }
//        return dayEntries
//    }
    
    // MARK:  Delete notes
    func deleteEntry(entry: DaysEntity) -> Bool {
        let context = persistentContainer.viewContext
        context.delete(entry)
        
        do {
            try context.save()
            return true
        } catch let err {
            print("Error deleting note entity instance", err)
            return false
        }
    }
    
    // MARK:  Update notes
//    func saveUpdatedEntry(entry: Entry, newRate: Int32, newText: String) {
//        let context = persistentContainer.viewContext
//        
//        entry.rate = newRate
//        entry.text = newText
//        entry.date = Date()
//        
//        do {
//            try context.save()
//        } catch let err {
//            print("Failed to update note", err)
//        }
//    }
    
    
    
}

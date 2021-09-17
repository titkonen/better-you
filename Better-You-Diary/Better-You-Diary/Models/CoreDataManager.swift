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
    
//    func saveText(text: String) {
//        let context = persistentContainer.viewContext
//        
//        let textInstance = DaysEntity(context: context)
//        textInstance.text = text
//            
//        do {
//            try context.save()
//            print("Text is saved")
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
    func saveTextAndDate(text: String, date: Date) {
        let context = persistentContainer.viewContext
        
        let savedContentInstance = DaysEntity(context: context)
        savedContentInstance.text = text
        savedContentInstance.date = date
            
        do {
            try context.save()
            print("Text and Date is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveRate(rate: Int32) {
        let context = persistentContainer.viewContext
        
        let savedContentInstance2 = DaysEntity(context: context)
//        savedContentInstance.text = text
//        savedContentInstance.date = date
        savedContentInstance2.rate = rate
            
        do {
            try context.save()
            print("Rate is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveTextAndDateAndRate(text: String, date: Date, rate: Int32) {
        let context = persistentContainer.viewContext
        
        let savedContentInstance3 = DaysEntity(context: context)
        savedContentInstance3.text = text
        savedContentInstance3.date = date
        savedContentInstance3.rate = rate
            
        do {
            try context.save()
            print("Text and Date is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Fetch Notes
//    func fetchEntries(_: DaysEntity) -> [DaysEntity] {
//        guard let dayEntries = days?.allObjects as? [DaysEntity] else {
//            return []
//        }
//        return dayEntries
//    }
    
    func fetchEntriesNewVersion() -> [DaysEntity] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DaysEntity>(entityName: "DaysEntity")
        
        do {
            let dayEntities = try context.fetch(fetchRequest)
            print("Fetched content")
            return dayEntities
        } catch let err {
            print("Failed to fetch note folders",err)
            return []
        }
    }
    
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

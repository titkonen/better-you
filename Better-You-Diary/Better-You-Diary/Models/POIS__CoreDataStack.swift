import Foundation
import CoreData

//protocol UsesCoreDataObjects: class {
//  var managedObjectContext: NSManagedObjectContext? { get set }
//}

class CoreDataStack {
  
    private let modelName: String
  
  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()
  
  init(modelName: String) {
    self.modelName = modelName
  }
  
  private lazy var storeContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()
  
  func saveContext () {
    guard managedContext.hasChanges else { return }
    
    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Unresolved error \(error), \(error.userInfo)")
    }
  }
    
    // MARK:  Update notes Testing
    func saveUpdatedEntryTesting(entry: DaysEntity, newUpdatedText: String) {
       // let context = persistentContainer.viewContext
        
        guard managedContext.hasChanges else { return }
        
        //entry.rate = newRate
        entry.text = newUpdatedText
        entry.date = Date()

        do {
            try managedContext.save()
            print("Entry updates succeed")
        } catch let err {
            print("Failed to update text1", err)
        }
    }
  
}

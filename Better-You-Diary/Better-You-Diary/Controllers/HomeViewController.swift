import UIKit

class HomeViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var TextView: UITextView!
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IB ACTIONS
    @IBAction func saveText(_ sender: UIButton) {
        
            if let sisaltoData = TextView.text {
                CoreDataManager.shared.saveTextAndDate(text: sisaltoData, date: Date())
                print("Teksti tallennettu!")
            }
        
    }
    
//    @IBAction func saveText(_ sender: UIButton) {
//
//            if let tekstiData = TextView.text {
//                CoreDataManager.shared.saveText(text: tekstiData)
//                print("Teksti tallennettu!")
//            }
//
//    }

    
}


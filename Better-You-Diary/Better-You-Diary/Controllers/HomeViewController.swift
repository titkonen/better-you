import UIKit

class HomeViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var rateControl: UISegmentedControl!
    
    
    
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
    @IBAction func rateButtonPressed(_ sender: UIButton) {
//        if let sisaltoData2 = rateControl {
//            CoreDataManager.shared.saveRate(rate: sisaltoData2)
//            print("Rate tallennettu!")
//        }
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        
        switch rateControl.selectedSegmentIndex
            {
            case 0:
                let value1: Int32 = 1
                CoreDataManager.shared.saveRate(rate: value1)
                print("Rate1 Tallennettu SegmentControllista!")
            case 1:
                let value2: Int32 = 2
                CoreDataManager.shared.saveRate(rate: value2)
                print("Rate2 Tallennettu SegmentControllista!")
            case 2:
                let value3: Int32 = 3
                CoreDataManager.shared.saveRate(rate: value3)
                print("Rate3 Tallennettu SegmentControllista!")
            case 3:
                let value4: Int32 = 4
                CoreDataManager.shared.saveRate(rate: value4)
                print("Rate4 Tallennettu SegmentControllista!")
            case 4:
                let value5: Int32 = 5
                CoreDataManager.shared.saveRate(rate: value5)
                print("Rate5 Tallennettu SegmentControllista!")
            default:
                break
            }
        
        
//        if let sisaltoData2 = rateControl {
//                    CoreDataManager.shared.saveRate(rate: sisaltoData2)
//                    print("Rate tallennettu!")
//                }
        
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


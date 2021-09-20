import UIKit

class HomeViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var rateControl: UISegmentedControl!
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        TextView.layer.cornerRadius = 12
    }
    
    func showAlertModal() {
        let alert = UIAlertController(title: "Content saved successfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//            switch action.style{
//                case .default:
//                print("default")
//
//                case .cancel:
//                print("cancel")
//
//                case .destructive:
//                print("destructive")
//
//            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    //MARK: IB ACTIONS
    @IBAction func saveTextDateRateButtonPressed(_ sender: UIButton) {
        
        switch rateControl.selectedSegmentIndex {
            case 0:
                if let sisaltoData = TextView.text {
                    let value1: Int32 = 1
                    CoreDataManager.shared.saveTextAndDateAndRate(text: sisaltoData, date: Date(), rate: value1)
                    print("Teksti ja Rate1 tallennettu!")
                }
            case 1:
                if let sisaltoData = TextView.text {
                    let value2: Int32 = 2
                    CoreDataManager.shared.saveTextAndDateAndRate(text: sisaltoData, date: Date(), rate: value2)
                    print("Teksti ja Rate2 tallennettu!")
                }
            case 2:
                if let sisaltoData = TextView.text {
                    let value3: Int32 = 3
                    CoreDataManager.shared.saveTextAndDateAndRate(text: sisaltoData, date: Date(), rate: value3)
                    print("Teksti ja Rate3 tallennettu!")
                }
            case 3:
                if let sisaltoData = TextView.text {
                    let value4: Int32 = 4
                    CoreDataManager.shared.saveTextAndDateAndRate(text: sisaltoData, date: Date(), rate: value4)
                    print("Teksti ja Rate4 tallennettu!")
                }
            case 4:
                if let sisaltoData = TextView.text {
                    let value5: Int32 = 5
                    CoreDataManager.shared.saveTextAndDateAndRate(text: sisaltoData, date: Date(), rate: value5)
                    print("Teksti ja Rate5 tallennettu!")
                }
            default:
                break
            }
        
        showAlertModal()
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        // DONT REMOVE
    }
    


    
}


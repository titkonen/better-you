import UIKit

class HomeViewController: UIViewController, UITextViewDelegate {

    //MARK: OUTLETS
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var rateControl: UISegmentedControl!
    @IBOutlet weak var saveTextButton: UIButton!
    
    //MARK: PROPERTIES
    
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        TextView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        TextView.layer.cornerRadius = 12
        TextView.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        saveTextButton.backgroundColor = UIColor(red: 237/255, green: 144/255, blue: 28/255, alpha: 1)
        saveTextButton.layer.cornerRadius = 24.0
        saveTextButton.tintColor = .white
        saveTextButton.frame.size = CGSize(width: 192, height: 48)
        saveTextButton.center.x = self.view.center.x
    }
    
    //MARK: FUNCTIONS
    func showAlertModal() {
        let alert = UIAlertController(title: "Content saved successfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        TextView.text = ""
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        TextView.resignFirstResponder()
        return true
    }

    //MARK: IB ACTIONS
    @IBAction func saveTextDateRateButtonPressed(_ sender: UIButton) {
        
        switch rateControl.selectedSegmentIndex {
            case 0:
                if let sisaltoData = TextView.text {
                    let value1: Int32 = 1
                    CoreDataManager.shared.createNewEntry(text: sisaltoData, date: Date(), rate: value1)
                    print("Teksti ja Rate1 tallennettu!")
                }
            case 1:
                if let sisaltoData = TextView.text {
                    let value2: Int32 = 2
                    CoreDataManager.shared.createNewEntry(text: sisaltoData, date: Date(), rate: value2)
                    print("Teksti ja Rate2 tallennettu!")
                }
            case 2:
                if let sisaltoData = TextView.text {
                    let value3: Int32 = 3
                    CoreDataManager.shared.createNewEntry(text: sisaltoData, date: Date(), rate: value3)
                    print("Teksti ja Rate3 tallennettu!")
                }
            case 3:
                if let sisaltoData = TextView.text {
                    let value4: Int32 = 4
                    CoreDataManager.shared.createNewEntry(text: sisaltoData, date: Date(), rate: value4)
                    print("Teksti ja Rate4 tallennettu!")
                }
            case 4:
                if let sisaltoData = TextView.text {
                    let value5: Int32 = 5
                    CoreDataManager.shared.createNewEntry(text: sisaltoData, date: Date(), rate: value5)
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


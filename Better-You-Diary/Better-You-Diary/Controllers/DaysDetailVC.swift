import UIKit

class DaysDetailVC: UIViewController, UINavigationControllerDelegate {
    
    // MARK: PROPERTIES
    var daysEntity: DaysEntity!
    
    let dateFormatter: DateFormatter = {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM dd, YYYY HH:mm"
          return dateFormatter
    }()
    
    var daysData: DaysEntity! {
        didSet {
            tekstikentta.text = daysData.text
            dateLabel.text = dateFormatter.string(from: daysData.date ?? Date())
            rateLabel.text = String(daysData.rate)
        }
    }
    
    fileprivate lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.text = dateFormatter.string(from: daysData.date ?? Date())
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var tekstikentta: UITextView = {
        //let label = UILabel()
        let tekstilaatikko = UITextView()
        tekstilaatikko.translatesAutoresizingMaskIntoConstraints = false
        tekstilaatikko.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        tekstilaatikko.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        tekstilaatikko.text = "Thoughts of the day"
        tekstilaatikko.textAlignment = .left
        return tekstilaatikko
    }()
    
    fileprivate lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.text = "Rate of the day"
        label.textAlignment = .left
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad is loaded")
        view.backgroundColor = .orange
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
      //print("viewWillAppear is loaded 2")
      
      //distanceLabel.text = daysData.text
      //durationLabel.text = String(noteData.duration) + " sec"
      //dateLabel?.text = "HELLO HELLO"
      
    }
    
    // MARK: UI
    
    fileprivate func setupUI() {
        view.addSubview(dateLabel)
        view.addSubview(tekstikentta)
        view.addSubview(rateLabel)
        
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        rateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        rateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        rateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        rateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -640).isActive = true
        
        tekstikentta.topAnchor.constraint(equalTo: view.topAnchor, constant: 220).isActive = true
        tekstikentta.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tekstikentta.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tekstikentta.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -560).isActive = true
      

        
      
    }
    
    
    
}

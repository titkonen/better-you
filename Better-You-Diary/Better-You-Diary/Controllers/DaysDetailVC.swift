import UIKit

class DaysDetailVC: UIViewController, UINavigationControllerDelegate {
    
    // MARK: PROPERTIES
    var daysEntity: DaysEntity!
    
    let dateFormatter: DateFormatter = {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM dd, YYYY hh:mm"
          //dateFormatter.dateFormat = "MM/dd/yy"
          return dateFormatter
    }()
    
    var daysData: DaysEntity! {
        didSet {
          distanceLabel.text = daysData.text
          //durationLabel.text = String(noteData.duration)
          dateLabel.text = dateFormatter.string(from: daysData.date ?? Date())
        }
    }
    
    fileprivate lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.text = dateFormatter.string(from: daysData.date ?? Date())
        //label.text = "HELLO HELLO 3"
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        //label.text = dateFormatter.string(from: Date())
        label.text = "distance !!!"
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
      
        navigationController?.navigationBar.barTintColor = UIColor.green
      view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
      //print("viewWillAppear is loaded 2")
      
      distanceLabel.text = daysData.text
      //durationLabel.text = String(noteData.duration) + " sec"
      //dateLabel?.text = "HELLO HELLO"
      
    }
    
    // MARK: UI
    
    fileprivate func setupUI() {
        view.addSubview(dateLabel)
        view.addSubview(distanceLabel)
//        view.addSubview(durationLabel)
//        view.addSubview(mapView)
        
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        distanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        distanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        distanceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -640).isActive = true
      
        
      
    }
    
    
    
}

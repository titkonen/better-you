import UIKit

protocol NoteDelegate {
    func saveNewNote(text: String, date: Date, rate: Int32)
}

class DaysDetailVC: UIViewController {
    
    // MARK: Photo properties
    var image: UIImage?
    
    // MARK: PROPERTIES
    var daysEntity: DaysEntity!
    lazy var coreDataStack = CoreDataStack(modelName: "better-you-datamodel")
    
    let dateFormatter: DateFormatter = {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM dd, YYYY HH:mm"
          return dateFormatter
    }()
    
    var daysEntryData: DaysEntity! {
        didSet {
            tekstikentta.text = daysEntryData.text
            dateLabel.text = dateFormatter.string(from: daysEntryData.date ?? Date())
            rateLabel.text = String(daysEntryData.rate)
        }
    }
    
    var delegate: NoteDelegate?
    
    fileprivate lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.text = dateFormatter.string(from: daysEntryData.date ?? Date())
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
        tekstilaatikko.isEditable = true
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
    
    fileprivate lazy var imageBox: UIImageView = {
        let box = UIImageView()
        box.frame = CGRect(x: 20, y: 410, width: 300, height: 200)
        box.backgroundColor = .lightGray
        return box
    }()
    
    fileprivate var loadPhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.frame = CGRect(x: 20, y: 350, width: 100, height: 40)
        button.setTitle("Load Photo", for: .normal)
        button.addTarget(self, action: #selector(loadPhotoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    fileprivate var savePhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.frame = CGRect(x: 160, y: 350, width: 100, height: 40)
        button.setTitle("Save Photo", for: .normal)
        button.addTarget(self, action: #selector(savePhotoButtonPressed), for: .touchUpInside) ///savePhotoButtonPressed
        return button
    }()
    
    // MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tekstikentta.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        tekstikentta.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        tekstikentta.layer.cornerRadius = 12
        //tekstikentta.delegate = self
        
        print("viewDidLoad is loaded")
        //view.backgroundColor = .orange
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
      //print("viewWillAppear is loaded 2")
        
        let topItems: [UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.updateText)),
        ]

        self.navigationItem.setRightBarButtonItems(topItems, animated: false)
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.daysEntryData == nil {
            delegate?.saveNewNote(text: tekstikentta.text, date: Date(), rate: Int32(rateLabel.text!)!)
            print("Route A")
        } else {
            // update our note here
            guard let newUpdatedText = self.tekstikentta.text else {
                return
            }
            CoreDataManager.shared.saveUpdatedEntry(entry: self.daysEntryData, newUpdatedText: newUpdatedText)
            print("Route B")
        }
    }
    
    // MARK: Photo Feature Functions
    func show(image: UIImage) {
        imageBox.image = image
    }
    
    @objc fileprivate func loadPhotoButtonPressed() {
        print("loadPhotoButtonPressed")
        pickPhoto()
    }
    
    @objc fileprivate func savePhotoButtonPressed() {
        print("savePhotoButtonPressed")
    }
    
    // MARK: Functions
    @objc fileprivate func updateText() {
        
        if self.daysEntryData == nil {
            delegate?.saveNewNote(text: tekstikentta.text, date: Date(), rate: Int32(rateLabel.text!)!)
            print("Route C")
        } else {
            // update our note here
            guard let newUpdatedText = self.tekstikentta.text else {
                return
            }
            CoreDataManager.shared.saveUpdatedEntry(entry: self.daysEntryData, newUpdatedText: newUpdatedText)
            //coreDataStack.saveUpdatedEntryTesting(entry: self.daysEntryData, newUpdatedText: newUpdatedText)
            print("Route D1")
        }
        print("updateText Pressed 2")
    }
    
    // MARK: BUILDING THE UI
    fileprivate func setupUI() {
        view.addSubview(dateLabel)
        view.addSubview(tekstikentta)
        view.addSubview(rateLabel)
        view.addSubview(imageBox)
        view.addSubview(loadPhotoButton)
        view.addSubview(savePhotoButton)
        
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

// MARK: Photo Extensions
extension DaysDetailVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // MARK: - Image Helper Methods
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func pickPhoto() {
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
        showPhotoMenu()
      } else {
        choosePhotoFromLibrary()
      }
    }

    func showPhotoMenu() {
      let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)

      let actPhoto = UIAlertAction(
        title: "Take Photo",
        style: .default) { _ in
        self.takePhotoWithCamera()
      }
        
      alert.addAction(actPhoto)

      let actLibrary = UIAlertAction(
        title: "Choose From Library",
        style: .default) { _ in
          self.choosePhotoFromLibrary()
        }
      alert.addAction(actLibrary)

      present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Image Picker Delegates
    ///This is for showing photo in view
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
          if let theImage = image {
            show(image: theImage) /// Calls show photo function
          }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}


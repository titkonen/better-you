import UIKit

class DaysCell: UITableViewCell {
    
    var daysData: DaysEntity! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy HH:mm"
            dayTitle.text = daysData.text
            dateLabel.text = dateFormatter.string(from: daysData.date ?? Date())
            rateLabel.text = String(daysData.rate)
        }
    }
    
    /// Day text
    fileprivate var dayTitle: UILabel = {
        let label = UILabel()
        label.text = "Places to take photos"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()

    /// Date label
    fileprivate var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "4/6/2019"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        return label
    }()
        
    /// Rate label
    fileprivate var rateLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 15/255, green: 193/255, blue: 246/255, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    /// horizontal stack view
    fileprivate lazy var horizontalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [rateLabel, dayTitle, UIView()])
        s.axis = .horizontal
        s.spacing = 20
        s.alignment = .leading
        return s
    }()
    
    /// vertical stack view
    fileprivate lazy var verticalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateLabel, horizontalStackView])
        s.axis = .vertical
        s.spacing = 5
        
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
      
        contentView.addSubview(verticalStackView)
        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
}



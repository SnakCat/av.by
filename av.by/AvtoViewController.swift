import UIKit

final class AvtoViewController: UIViewController {
    // MARK: - private propertys
    private let callButton = UIButton()
    private let smsButton = UIButton()
    private let avtoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupConstraints()
        setupUI()
        
    }
    // MARK: - helpers methods
    // add sub view
    private func addSubView() {
        view.addSubviews(callButton, smsButton, avtoTableView)
    }
    // constreint
    private func setupConstraints() {
        callButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            callButton.heightAnchor.constraint(equalToConstant: 50),
            callButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.77)
        ])
        smsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            smsButton.leadingAnchor.constraint(equalTo: callButton.trailingAnchor, constant: 6),
            smsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            smsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    // UI
    private func setupUI() {
        callButton.backgroundColor = .buttonCallSMS
        callButton.layer.cornerRadius = 10
        callButton.setTitle("Позвонить", for: .normal)
        
        smsButton.backgroundColor = .buttonCallSMS
        smsButton.layer.cornerRadius = 10
        smsButton.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        smsButton.tintColor = .white
    }
    
    
    
}

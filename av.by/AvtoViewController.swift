import UIKit

final class AvtoViewController: UIViewController {
    // MARK: - private propertys
    private let callButton = UIButton()
    private let smsButton = UIButton()
    private let avtoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        addSubView()
        setupConstraints()
        setupUI()
        avtoTableView.delegate = self
        avtoTableView.dataSource = self

        
    }
    // MARK: - helpers methods
    // add sub view
    private func addSubView() {
        view.addSubviews(avtoTableView, callButton, smsButton)
    }
    // constreint
    private func setupConstraints() {
        avtoTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avtoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            avtoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avtoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avtoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        callButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            callButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            callButton.heightAnchor.constraint(equalToConstant: 50),
            callButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.77)
        ])
        smsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            smsButton.leadingAnchor.constraint(equalTo: callButton.trailingAnchor, constant: 6),
            smsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            smsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    // UI
    private func setupUI() {
        
        let alertButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(alertButtonTapped))
        navigationItem.rightBarButtonItem = alertButton
        
        callButton.backgroundColor = .buttonCallSMS
        callButton.layer.cornerRadius = 10
        callButton.setTitle("Позвонить", for: .normal)
        callButton.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
        
        smsButton.backgroundColor = .buttonCallSMS
        smsButton.layer.cornerRadius = 10
        smsButton.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        smsButton.tintColor = .white
        smsButton.addTarget(self, action: #selector(smsButtonTapped), for: .touchUpInside)
    }
    // implement action buttons delegate
    @objc private func callButtonTapped() {
        print("Звоню")
    }
    @objc private func smsButtonTapped() {
        print("sms")
    }
    @objc private func alertButtonTapped() {
        print("тут будет алерт")
    }
    
    
}
    // MARK: - extension
    // table view cell
extension AvtoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        1000
    }
    
    
}
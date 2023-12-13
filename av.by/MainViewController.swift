import UIKit

final class MainViewController: UIViewController {
    // MARK: - private propertis
    private let startButton = UIButton()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(startButton)
        setupConstraints()
        setupUI()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    // MARK: - helpers methods
    // constraints
    private func setupConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 35),
            startButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    // UI
    private func setupUI() {
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .systemBlue
        startButton.addTarget(self, action: #selector(tappedStart), for: .touchUpInside)
    }
    // tapp Button
    @objc private func tappedStart() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}


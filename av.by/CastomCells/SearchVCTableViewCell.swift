import UIKit

final class SearchVCTableViewCell: UITableViewCell {
    // MARK: - provate propertis
    private let contenerView = UIView()
    private let favoriteButton = UIButton()
    private let nameCarLabel = UILabel()
    private let priceLabel = UILabel()
    private let dallarLabel = UILabel()
    //private let imagesCollection = UICollectionView()
    private let tapImagesCollection = UIButton()
    
    
    // MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubCell()
        setupConstraints()
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - helpers methods
    private func addSubCell() {
        contentView.addSubview(contenerView)
        contenerView.addSubviews(favoriteButton, nameCarLabel, priceLabel)
    }
    // constreints
    private func setupConstraints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8),
            favoriteButton.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 13),
        ])
        nameCarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameCarLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 13),
            nameCarLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            nameCarLabel.heightAnchor.constraint(equalToConstant: 60),
            nameCarLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.7)
        ])
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            priceLabel.topAnchor.constraint(equalTo: nameCarLabel.bottomAnchor, constant: 10),
            priceLabel.heightAnchor.constraint(equalToConstant: 40),
            priceLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.3)
        ])
        
    }
    // UI
    private func setupUI() {
        favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        contenerView.backgroundColor = .gray
        contenerView.layer.cornerRadius = 10
        
        nameCarLabel.textAlignment = .left
        nameCarLabel.numberOfLines = 2
        nameCarLabel.backgroundColor = .red
        
        priceLabel.textAlignment = .left
        priceLabel.backgroundColor = .green
    }
    

  
}
    // MARK: - extension
extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach(addSubview)
    }
}

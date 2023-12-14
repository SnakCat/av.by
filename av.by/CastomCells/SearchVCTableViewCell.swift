import UIKit
// MARK: - protocol
protocol searchVCTableViewCellDelegate: AnyObject {
    func favoriteButtonTapped()
    func lizingButtonTapped()
}

final class SearchVCTableViewCell: UITableViewCell {
    // MARK: - provate propertys
    private let contenerView = UIView()
    private let favoriteButton = UIButton()
    private let nameCarLabel = UILabel()
    private let priceLabel = UILabel()
    private let dallarLabel = UILabel()
    private let imagesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewFlowLayout()
    private let infoCarLabel = UILabel()
    private let lizingNameLabel = UILabel()
    private let lizingPriceLabel = UILabel()
    private let lizingButton = UIButton()
    private let lineView = UIView()
    private let dollarLabel = UILabel()
    private let cityNameLabel = UILabel()
    private let vinTopStackView = UIStackView()
    private let topImageView = UIImageView()
    private let vinImageView = UIImageView()
    private var imagesArray = [UIImage]()
    private let dateLabel = UILabel()
    
    // delegate property
    weak var delegate: searchVCTableViewCellDelegate?
    
    // MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubCell()
        setupConstraints()
        setupUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    // MARK: - setup collection view
    private func setupCollectionView() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 200)
        imagesCollectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: "IconCollectionViewCell")
    }
    
    // MARK: - config for tableViewCell
    func configure(wiht car: InfoCar) {
        nameCarLabel.text = car.name
        priceLabel.text = "\(car.price) р."
        dollarLabel.text = "~ \(car.dollar) $"
        imagesArray = car.photos
        infoCarLabel.text = "\(car.yaer)г., \(car.transmission.rawValue), \(car.sizeEngine), \(car.typeEngine.rawValue), \(car.carBody.rawValue), \(car.odometer) км"
        topImageView.image = UIImage(named: "top")
        vinImageView.image = UIImage(named: "vin")
        cityNameLabel.text = car.city
        dateLabel.text = car.date
        lizingPriceLabel.text = "от \(car.lizing) USD/месяц"
        if car.top == true {
            topImageView.isHidden = false
        }
        if car.vin == true {
            vinImageView.isHidden = false
        }
        if car.top == false && car.vin == false {
            vinTopStackView.isHidden = false
            offStickersStackView()
        } else {
            onStickersStackView()
        }
        imagesCollectionView.reloadData()
    }
    
    // MARK: - helpers methods
    // add subviewCell
    private func addSubCell() {
        contentView.addSubview(contenerView)
        contenerView.addSubviews(favoriteButton, nameCarLabel, priceLabel, imagesCollectionView, infoCarLabel, lizingNameLabel, lizingPriceLabel, lizingButton, lineView, dollarLabel, cityNameLabel, dateLabel, vinTopStackView)
        vinTopStackView.addArrangedSubviews(vinImageView, topImageView)
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
            nameCarLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 11),
            nameCarLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            nameCarLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.7)
        ])
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            priceLabel.topAnchor.constraint(equalTo: nameCarLabel.bottomAnchor, constant: 10),
        ])
        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagesCollectionView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            imagesCollectionView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8),
            imagesCollectionView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 13),
            imagesCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
        infoCarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoCarLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            infoCarLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -30),
            infoCarLabel.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 8),
        ])
        lizingNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lizingNameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            lizingNameLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            lizingNameLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.4),
            lizingNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        lizingPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lizingPriceLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8),
            lizingPriceLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            lizingPriceLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.5),
            lizingPriceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        lizingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lizingButton.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            lizingButton.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8),
            lizingButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15),
            lizingButton.heightAnchor.constraint(equalToConstant: 40),
            lizingButton.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor)
        ])
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            lineView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        dollarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dollarLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            dollarLabel.bottomAnchor.constraint(equalTo: imagesCollectionView.topAnchor, constant: -13),
            dollarLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.3)
        ])
        vinTopStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vinTopStackView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            vinTopStackView.topAnchor.constraint(equalTo: infoCarLabel.bottomAnchor, constant: 8),
            vinTopStackView.heightAnchor.constraint(equalToConstant: 20),
        ])
        topImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        topImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topImageView.contentMode = .scaleAspectFit
        
        vinImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vinImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        vinImageView.contentMode = .scaleAspectFit
    }
    // methods stackView isHidden
    private func offStickersStackView() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            cityNameLabel.topAnchor.constraint(equalTo: infoCarLabel.bottomAnchor, constant: 10)
        ])
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: infoCarLabel.bottomAnchor, constant: 10)
        ])
    }
    private func onStickersStackView() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            cityNameLabel.topAnchor.constraint(equalTo: vinTopStackView.bottomAnchor, constant: 10)
        ])
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: vinTopStackView.bottomAnchor, constant: 10)
        ])
    }
    // UI
    private func setupUI() {
        contentView.layer.cornerRadius = 10

        imagesCollectionView.backgroundColor = .clear
        imagesCollectionView.layer.cornerRadius = 10
        
        favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        favoriteButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .bold), forImageIn: .normal)
        favoriteButton.tintColor = .itemTabBar
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        contenerView.backgroundColor = .tabBarCV
        contenerView.layer.cornerRadius = 10
        
        nameCarLabel.numberOfLines = 0
        
        priceLabel.font = .boldSystemFont(ofSize: 25)
                
        infoCarLabel.numberOfLines = 0
        
        lizingNameLabel.textColor = .lizing
        lizingNameLabel.text = "Лизинг"
        
        lizingPriceLabel.textColor = .lizing
        lizingPriceLabel.textAlignment = .right
        
        lizingButton.backgroundColor = .clear 
        lizingButton.addTarget(self, action: #selector(lizingButtonTapped), for: .touchUpInside)
        
        lineView.backgroundColor = .lightGray
        
        dollarLabel.textColor = .lightGray
        dollarLabel.font = .systemFont(ofSize: 15)
        
        cityNameLabel.textColor = .lightGray
        
        vinTopStackView.axis = .horizontal
        vinTopStackView.distribution = .fillEqually
        vinTopStackView.alignment = .leading
        vinTopStackView.spacing = 5
        
        topImageView.image = UIImage(named: "top")
        topImageView.layer.masksToBounds = true
        topImageView.layer.cornerRadius = 5
        topImageView.isHidden = true

        vinImageView.image = UIImage(named: "vin")
        vinImageView.layer.masksToBounds = true
        vinImageView.layer.cornerRadius = 5
        vinImageView.isHidden = true
        
        dateLabel.textColor = .lightGray
    }
    // implement action buttons
    @objc private func favoriteButtonTapped() {
        delegate?.favoriteButtonTapped()
    }
    @objc private func lizingButtonTapped() {
        delegate?.lizingButtonTapped()
    }
}
    // MARK: - extension
    // collection view cell
extension SearchVCTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let imageCell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            imageCell.setImage(imagesArray[indexPath.row])
            return imageCell
        }
        return UICollectionViewCell()
    }
    
}

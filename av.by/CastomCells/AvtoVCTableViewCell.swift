import UIKit

final class AvtoVCTableViewCell: UITableViewCell {
    // MARK: - provate propertys
    private let contenerView = UIView()
    private let nameCarLabel = UILabel()
    private let priceLabel = UILabel()
    private let dollarLabel = UILabel()
    private let imagesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewFlowLayout()
    
    // MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubCell()
        setupCollectionView()
        setupConstraints()
        setupUI()
        
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
        imagesCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        
    }
    // MARK: - helpers methods
    // add sub view
    private func addSubCell() {
        contentView.addSubview(contenerView)
        contenerView.addSubviews(nameCarLabel, priceLabel, dollarLabel, imagesCollectionView)
       
    }
    // constrant
    private func setupConstraints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
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
        dollarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dollarLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            dollarLabel.bottomAnchor.constraint(equalTo: imagesCollectionView.topAnchor, constant: -13),
            dollarLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.3)
        ])

    }
    
    // UI
    private func setupUI() {
        nameCarLabel.text = "CarCar"
        priceLabel.text = "1234"
        dollarLabel.text = "43121"
    }
    
}
    // MARK: - extension
    // collection view cell
extension AvtoVCTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let imageCell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            
            return imageCell
        }
        return UICollectionViewCell()
    }

    
    
}


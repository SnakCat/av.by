import UIKit

final class AvtoVCTableViewCell: UITableViewCell {
    // MARK: - provate propertys
    private let contenerView = UIView()
    private let nameCarLabel = UILabel()
    private let priceLabel = UILabel()
    private let dollarLabel = UILabel()
    private let imagesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewFlowLayout()
    private let redButton = UIButton()
    private let lizingLabel = UILabel()
    private let buttonsView = UIView()
    private let shareButton = UIButton()
    private let shareLabel = UILabel()
    private let commentButton = UIButton()
    private let commentLabel = UILabel()
    private let favorButton = UIButton()
    private let favorLabel = UILabel()
    private let lineTopView = UIView()
    private let discriptionLabel = UILabel()
    private let lineBottonView = UIView()
    private let cityLabel = UILabel()
    private let discriptionView = UIView()
    private let discriptionTitleLebel = UILabel()
    private let discriptionBodyLabel = UILabel()
    private let equipView = UIView()
    private let equipTitleLabel = UILabel()
    private let equipBodyLabel = UILabel()
    private let trideView = UILabel()
    private let trideTitleLabel = UILabel()
    private let tredeBodyLabel = UILabel()
    
    // MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubCell()
        setupCollectionView()
        setupConstraints()
        setupUI()
        selectionStyle = .none
        
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
        contenerView.addSubviews(nameCarLabel, priceLabel, dollarLabel, imagesCollectionView, lizingLabel, buttonsView, redButton, lineTopView, discriptionLabel, lineBottonView, cityLabel, discriptionView, equipView, trideView)
        buttonsView.addSubviews(shareButton, shareLabel, commentButton, commentLabel, favorButton, favorLabel)
        discriptionView.addSubviews(discriptionTitleLebel, discriptionBodyLabel)
        equipView.addSubviews(equipTitleLabel, equipBodyLabel)
        trideView.addSubviews(trideTitleLabel, tredeBodyLabel)
        
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
        lizingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lizingLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 10),
            lizingLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -10),
            lizingLabel.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 20),
            lizingLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsView.topAnchor.constraint(equalTo: lizingLabel.bottomAnchor, constant: 10),
            buttonsView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8),
            buttonsView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8),
            buttonsView.heightAnchor.constraint(equalToConstant: 90)
        ])
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentButton.centerXAnchor.constraint(equalTo: buttonsView.centerXAnchor),
            commentButton.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 15)
        ])
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentLabel.centerXAnchor.constraint(equalTo: buttonsView.centerXAnchor),
            commentLabel.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 7),
        ])
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 15),
            shareButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 50)
        ])
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareLabel.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 7),
            shareLabel.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 20)
        ])
        favorButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favorButton.topAnchor.constraint(equalTo: buttonsView.topAnchor, constant: 15),
            favorButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -50)
        ])
        favorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favorLabel.topAnchor.constraint(equalTo: favorButton.bottomAnchor, constant: 7),
            favorLabel.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -20)
        ])
        lineTopView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineTopView.topAnchor.constraint(equalTo: buttonsView.bottomAnchor),
            lineTopView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            lineTopView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            lineTopView.heightAnchor.constraint(equalToConstant: 1)
        ])
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: lineTopView.bottomAnchor, constant: 17),
            discriptionLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 10),
            discriptionLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -30),
            discriptionLabel.heightAnchor.constraint(equalTo: contenerView.heightAnchor, multiplier: 0.15)
        ])
        lineBottonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineBottonView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: -10),
            lineBottonView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            lineBottonView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            lineBottonView.heightAnchor.constraint(equalToConstant: 1)
        ])
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: lineBottonView.bottomAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 10),
            cityLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        discriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            discriptionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15),
            discriptionView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            discriptionView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            discriptionView.heightAnchor.constraint(equalTo: contenerView.heightAnchor, multiplier: 0.2)
        ])
        discriptionTitleLebel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            discriptionTitleLebel.topAnchor.constraint(equalTo: discriptionView.topAnchor, constant: 10),
            discriptionTitleLebel.leadingAnchor.constraint(equalTo: discriptionView.leadingAnchor, constant: 10),
            discriptionTitleLebel.trailingAnchor.constraint(equalTo: discriptionView.trailingAnchor, constant: -10),
            discriptionTitleLebel.heightAnchor.constraint(equalToConstant: 40)
        ])
        discriptionBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            discriptionBodyLabel.topAnchor.constraint(equalTo: discriptionTitleLebel.bottomAnchor, constant: 10),
            discriptionBodyLabel.leadingAnchor.constraint(equalTo: discriptionView.leadingAnchor, constant: 10),
            discriptionBodyLabel.trailingAnchor.constraint(equalTo: discriptionView.trailingAnchor, constant: -10),
            discriptionBodyLabel.bottomAnchor.constraint(equalTo: discriptionView.bottomAnchor, constant: -10)
        ])
        equipView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            equipView.topAnchor.constraint(equalTo: discriptionView.bottomAnchor, constant: 13),
            equipView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            equipView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            equipView.heightAnchor.constraint(equalTo: contenerView.heightAnchor, multiplier: 0.2)
        ])
        equipTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            equipTitleLabel.topAnchor.constraint(equalTo: equipView.topAnchor, constant: 10),
            equipTitleLabel.leadingAnchor.constraint(equalTo: equipView.leadingAnchor, constant: 10),
            equipTitleLabel.trailingAnchor.constraint(equalTo: equipView.trailingAnchor, constant: -10),
            equipTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        equipBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            equipBodyLabel.topAnchor.constraint(equalTo: equipTitleLabel.bottomAnchor, constant: 10),
            equipBodyLabel.leadingAnchor.constraint(equalTo: equipView.leadingAnchor, constant: 10),
            equipBodyLabel.trailingAnchor.constraint(equalTo: equipView.trailingAnchor, constant: -10),
            equipBodyLabel.bottomAnchor.constraint(equalTo: equipView.bottomAnchor, constant: -10)
        ])
        trideView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trideView.topAnchor.constraint(equalTo: equipView.bottomAnchor, constant: 13),
            trideView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            trideView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            trideView.heightAnchor.constraint(equalTo: contenerView.heightAnchor, multiplier: 0.1)
        ])
        trideTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trideTitleLabel.topAnchor.constraint(equalTo: trideView.topAnchor, constant: 10),
            trideTitleLabel.leadingAnchor.constraint(equalTo: trideView.leadingAnchor, constant: 10),
            trideTitleLabel.trailingAnchor.constraint(equalTo: trideView.trailingAnchor, constant: -10),
            trideTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        tredeBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tredeBodyLabel.topAnchor.constraint(equalTo: trideTitleLabel.bottomAnchor, constant: 10),
            tredeBodyLabel.leadingAnchor.constraint(equalTo: trideView.leadingAnchor, constant: 10),
            tredeBodyLabel.trailingAnchor.constraint(equalTo: trideView.trailingAnchor, constant: -10),
            tredeBodyLabel.bottomAnchor.constraint(equalTo: trideView.bottomAnchor, constant: -10)
        ])
        redButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redButton.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor),
            redButton.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor),
            redButton.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -65),
            redButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    // UI
    private func setupUI() {
        imagesCollectionView.layer.cornerRadius = 10
        imagesCollectionView.backgroundColor = .clear
        
        nameCarLabel.numberOfLines = 0
        
        priceLabel.font = .boldSystemFont(ofSize: 25)
        
        lizingLabel.layer.masksToBounds = true
        lizingLabel.layer.cornerRadius = 10
        lizingLabel.backgroundColor = .lizingBackground
        
        
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .lizing
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        shareLabel.text = "Поделиться"
        shareLabel.font = .systemFont(ofSize: 15)
        shareLabel.textColor = .lizing
        
        commentButton.setImage(UIImage(systemName: "doc.badge.plus"), for: .normal)
        commentButton.tintColor = .lizing
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        commentLabel.text = "Комментарий"
        commentLabel.font = .systemFont(ofSize: 15)
        commentLabel.textColor = .lizing
        
        favorButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        favorButton.tintColor = .lizing
        favorButton.addTarget(self, action: #selector(favorButtontapped), for: .touchUpInside)
        favorLabel.text = "В закладки"
        favorLabel.font = .systemFont(ofSize: 15)
        favorLabel.textColor = .lizing
        
        lineTopView.backgroundColor = .systemGray
        
        discriptionLabel.numberOfLines = 0
        
        lineBottonView.backgroundColor = .systemGray
        
        cityLabel.font = .systemFont(ofSize: 15)
        cityLabel.textColor = .systemGray
        
        
        discriptionTitleLebel.text = "Описание"
        discriptionTitleLebel.font = .systemFont(ofSize: 25)
        discriptionBodyLabel.numberOfLines = 0
        
        equipTitleLabel.text = "Комплектация"
        equipTitleLabel.font = .systemFont(ofSize: 25)
        equipBodyLabel.numberOfLines = 0
        
        trideTitleLabel.text = "Обмен"
        trideTitleLabel.font = .systemFont(ofSize: 25)
        tredeBodyLabel.numberOfLines = 0
    
        redButton.layer.cornerRadius = 10
        redButton.backgroundColor = .buttonRed
        redButton.setTitle("Пожаловаться", for: .normal)
        redButton.addTarget(self, action: #selector(redButtonTapped), for: .touchUpInside)
        
    }
    
    // implement action buttons delegate
    @objc private func redButtonTapped() {
        print("Пожаловаться")
    }
    @objc private func shareButtonTapped() {
        print("Поделиться")
    }
    @objc private func commentButtonTapped() {
        print("Комментарии")
    }
    @objc private func favorButtontapped() {
        print("В закладки")
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


import UIKit

final class SearchVCTableViewCell: UITableViewCell {
    // MARK: - provate propertis
    private let contenerView = UIView()
    private let favoriteButton = UIButton()
    private let nameCarLabel = UILabel()
    private let priceLabel = UILabel()
    private let dallarLabel = UILabel()
    private let imagesCollection = UICollectionView()
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
        contenerView.addSubviews(favoriteButton)
    }
    
    private func setupConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupUI() {
        favoriteButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    

  
}
    // MARK: - extension
extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach(addSubview)
    }
}

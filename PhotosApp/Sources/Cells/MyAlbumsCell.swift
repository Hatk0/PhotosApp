import UIKit
import SnapKit

class MyAlbumsCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumsCell"
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 3
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initalizers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
        
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(quantityLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(5)
            make.height.equalToSuperview().multipliedBy(0.7)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }

        quantityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.right.equalToSuperview().inset(10)
        }
    }

    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        self.imageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.quantityLabel.text = model.quantity
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}

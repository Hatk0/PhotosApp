import UIKit
import SnapKit

class SharedAlbumsCell: UICollectionViewCell {
    
    static let identifier = "SharedAlbumsCell"
    
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
    
    private lazy var createdByLabel: UILabel = {
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
        fatalError("ERROR")
    }
    
    // MARK: - Setup
        
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(createdByLabel)
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

        createdByLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.right.equalToSuperview().inset(10)
        }
    }

    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        self.imageView.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.createdByLabel.text = model.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}

import UIKit
import SnapKit

class MediaTypesListCell: UICollectionViewListCell {
    
    static let identifier = "MediaTypesListCell"
    
    // MARK: - UI
    
    private lazy var settingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var quantityLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Initializers
    
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
        contentView.addSubview(settingImageView)
        contentView.addSubview(titlelabel)
        contentView.addSubview(quantityLabel)
    }
    
    private func setupLayout() {
        settingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(35)
        }
        
        titlelabel.snp.makeConstraints { make in
            make.leading.equalTo(settingImageView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(150)
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {
        settingImageView.image = UIImage(systemName: model.image)
        titlelabel.text = model.title
        quantityLabel.text = model.quantity
    }
}

import UIKit
import SnapKit

class SharedAlbumsCell: UICollectionViewCell {
    
    // MARK: - UI
    
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

    }
    
    private func setupLayout() {

    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
}

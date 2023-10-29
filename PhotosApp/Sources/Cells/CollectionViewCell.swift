import UIKit
import SnapKit

class MediaTypesListCell: UICollectionViewListCell {
    
    static let identifier = "MediaTypesListCell"
    
    // MARK: - UI
    
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

    }
    
    private func setupLayout() {

    }
    
    // MARK: - Configuration
    
    func configuration(model: AlbumsModel) {

    }
}

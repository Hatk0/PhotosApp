import UIKit
import SnapKit

class UtilitiesListCell: UICollectionViewListCell {
    
    static let identifier = "UtilitiesListCell"
    
    // MARK: - UI
    
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

    }
    
    private func setupLayout() {

    }
    
    func configuration(model: AlbumsModel) {

    }
}

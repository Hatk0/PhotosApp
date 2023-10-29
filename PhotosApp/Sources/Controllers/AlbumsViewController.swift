import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(SharedAlbumsCell.self, forCellWithReuseIdentifier: SharedAlbumsCell.identifier)
        collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.right.bottom.left.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - CollectionViewLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            
            switch section {
            case 0:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = .init(top: 10,
                                                 leading: 10,
                                                 bottom: 10,
                                                 trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .estimated(250)
                )
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 0,
                                                                bottom: 20,
                                                                trailing: 0)
                
                return layoutSection
            case 1:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(1.0))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = .init(top: 10,
                                                 leading: 10,
                                                 bottom: 10,
                                                 trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .estimated(250))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(20))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 0,
                                                                bottom: 20,
                                                                trailing: 0)
                
                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 5)
                
                let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                             heightDimension: .estimated(300))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                
                return layoutSection
            }
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumsModel.modelArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "My Albums"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.title.text = "Shared Albums"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as! MyAlbumsCell
            cell.configuration(model: AlbumsModel.modelArray[indexPath.section][indexPath.item])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SharedAlbumsCell.identifier, for: indexPath) as! SharedAlbumsCell
            cell.configuration(model: AlbumsModel.modelArray[indexPath.section][indexPath.item])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCell.identifier, for: indexPath) as! MyAlbumsCell
            cell.configuration(model: AlbumsModel.modelArray[indexPath.section][indexPath.item])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AlbumsModel.modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

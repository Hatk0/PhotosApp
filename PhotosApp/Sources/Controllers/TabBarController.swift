import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup
    
    func setupTabBarController() {
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .systemGray6
    }
    
    func setupTabBarViewControllers() {
        let library = LibraryViewController()
        let libraryIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle"), selectedImage: UIImage(systemName: "photo.on.rectangle.fill"))
        library.tabBarItem = libraryIcon
        
        let forYou = ForYouViewController()
        let forYouIcon = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYou.tabBarItem = forYouIcon
        
        let albums = AlbumsViewController()
        let albumsIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack"), selectedImage: UIImage(systemName: "square.stack.fill"))
        albums.tabBarItem = albumsIcon
        
        let search = SearchViewController()
        let searchIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        search.tabBarItem = searchIcon
        
        let controllers = [library, forYou, albums, search]
        self.setViewControllers(controllers, animated: true)
    }
}

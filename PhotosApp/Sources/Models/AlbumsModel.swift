import Foundation

struct AlbumsModel: Hashable {
    let title: String?
    let description: String?
    let image: String
    let quantity: String?
}

extension AlbumsModel {
    static let modelArray = [
        
        // My Albums
        
        [AlbumsModel(title: "Recents", description: "", image: "recents", quantity: "4469"),
        AlbumsModel(title: "Favourites", description: "", image: "favourites", quantity: "10"),
        AlbumsModel(title: "Animals", description: "", image: "animals", quantity: "54"),
        AlbumsModel(title: "Art", description: "", image: "art", quantity: "100"),
        AlbumsModel(title: "Shots", description: "", image: "shots", quantity: "215"),
        AlbumsModel(title: "Nature", description: "", image: "nature", quantity: "692")
        ],
        
        // Shared Albums
        
        [AlbumsModel(title: "Car", description: "Created by Alex", image: "car", quantity: ""),
        AlbumsModel(title: "Comics", description: "Created by Peter", image: "comics", quantity: ""),
        AlbumsModel(title: "Subway", description: "Created by James", image: "subway", quantity: ""),
        AlbumsModel(title: "Sunrise", description: "Created by Leo", image: "sunrise", quantity: "")
        ]
    ]
}


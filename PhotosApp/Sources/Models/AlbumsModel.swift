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
        ],
        
        // Media Types
        
        [AlbumsModel(title: "Videos", description: "", image: "video", quantity: "76"),
         AlbumsModel(title: "Selfies", description: "", image: "person.crop.square", quantity: "464"),
         AlbumsModel(title: "Portrait", description: "", image: "cube", quantity: "6"),
         AlbumsModel(title: "Panoramas", description: "", image: "pano", quantity: "2"),
         AlbumsModel(title: "Bursts", description: "", image: "square.3.layers.3d.down.forward", quantity: "5"),
         AlbumsModel(title: "Screeenshots", description: "", image: "camera.viewfinder", quantity: "1113"),
         AlbumsModel(title: "Screen Recordings", description: "", image: "smallcircle.filled.circle", quantity: "4")
        ]
    ]
}


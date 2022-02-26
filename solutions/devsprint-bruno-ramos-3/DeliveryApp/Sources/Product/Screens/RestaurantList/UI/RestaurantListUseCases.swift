import Foundation

enum RestaurantList {
    struct FetchRestaurantList {
        struct Request {}

        enum Response {
            case success([Restaurant])
            case failure(Error)
        }

        struct ViewModel {
            let restaurantListViewModel: [RestaurantListView.ViewModel]
        }
    }
}

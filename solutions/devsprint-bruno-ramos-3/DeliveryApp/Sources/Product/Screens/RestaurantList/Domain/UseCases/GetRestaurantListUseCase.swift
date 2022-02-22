import Foundation

protocol GetRestaurantListUseCase {
    func execute(completion: @escaping (Result<[Restaurant], Error>) -> Void)
}

final class GetRestaurantList: GetRestaurantListUseCase {
    private let repository: RestaurantListRepository

    init(repository: RestaurantListRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        repository.fetchRestaurantList(completion: completion)
    }
}

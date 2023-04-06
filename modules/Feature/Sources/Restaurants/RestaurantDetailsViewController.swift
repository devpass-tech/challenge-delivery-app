import UIFoundations
import Navigation
import UIKit

public final class RestaurantDetailsViewController: UIViewController {
    private var detailView: RestaurantDetailsView = {
        RestaurantDetailsView()
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = detailView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

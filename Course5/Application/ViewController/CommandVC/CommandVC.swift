import UIKit
import RxSwift
import RxDataSources

class CommandVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    
    private let category: Category
    
    private var viewModel = CommandVM()
    
    private let bag = DisposeBag()
    
    init(_ category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
        bindViewModel()
        
        viewModel.fetchData(category)
    }
    
    private func initViews() {
        titleLabel.text = category.displayName
        setupTableView()
    }
    
    private func setupTableView() {
        let identifier = "CommandTableViewCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: identifier)
        
        itemTableView.showsVerticalScrollIndicator = false
        itemTableView.separatorStyle = .none
        itemTableView.sectionFooterHeight = 16
        
        itemTableView.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.commandsSub
            .asObserver()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: self.itemTableView.rx.items(dataSource: getCommandsDataSource()))
            .disposed(by: bag)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

extension CommandVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58 + 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

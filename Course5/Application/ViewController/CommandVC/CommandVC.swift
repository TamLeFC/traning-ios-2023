import UIKit
import RxSwift
import RxDataSources

class CommandVC: BaseVC<CommandVM> {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    
    override func configureListView() {
        setupTableView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.titleS
            .asObservable()
            .subscribe(onNext: {[weak self] title in
                guard let self = self else { return }
                self.titleLabel.text = title
            }).disposed(by: bag)
        
        viewModel.commandsS
            .asObservable()
            .map { [SectionModel(model: (), items: $0)] }
            .bind(
                to: self.itemTableView.rx.items(
                    dataSource: getCommandsDataSource() {[weak self] cmd in
                        guard let self = self else { return }
                        self.viewModel.favoriteChanged(cmd)
                    }
                )
            )
            .disposed(by: bag)
        
        viewModel.fetchData()
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

extension CommandVC {
    
    private func setupTableView() {
        let nib = UINib(nibName: CommandTableViewCell.identifier, bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: CommandTableViewCell.identifier)
        
        itemTableView.showsVerticalScrollIndicator = false
        itemTableView.separatorStyle = .none
        itemTableView.sectionFooterHeight = 16
        
        itemTableView.delegate = self
    }
}

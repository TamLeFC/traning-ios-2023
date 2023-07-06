//
//  CommandVC.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import UIKit
import RxDataSources

class CommandVC: BaseVC<CommandVM> {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
        
    }
    
    override func configureListView() {
        super.configureListView()
        
        tableView.registerCellNib(CommandCell.self)
    }
    
    
    override func addEventForViews() {
        super.addEventForViews()
        
        tableView.rx
            .modelSelected(Command.self)
            .subscribe(onNext: { [weak self] item in
                guard let self = self else { return }
                //MARK: - todo something
            })
            .disposed(by: bag)
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
                to: self.tableView.rx.items(
                    dataSource: getCommandsDataSource() {[weak self] cmd in
                        guard let self = self else { return }
                        self.viewModel.favoriteChanged(cmd)
                    }
                )
            )
            .disposed(by: bag)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  VoiceVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit
import RxDataSources

class CommandVC: BaseVC<CommandVM> {

    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        appLabel.font = UIFont(name: "Inter-Medium", size: 16)
        tableView.registerCellNib(CommandCell.self)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.titleS
            .asObservable()
            .subscribe(onNext: {[weak self] title in
                guard let self = self else { return }
                self.titleLabel.text = title
            }).disposed(by: bag)
        
        viewModel.commandS
            .map { [SectionModel(model: (), items: $0)] }
            .bind(
                to: tableView.rx.items(
                    dataSource: getCommandsDataSource(onFavoriteChanged: { [weak self] cmd in
                        guard let self = self else { return }
                        self.viewModel.favoriteChanged(cmd)
                    })
                )
            )
            .disposed(by: bag)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        tableView.rx
            .modelSelected(Command.self)
            .subscribe(onNext: { [weak self] item in
                guard self != nil else { return }
                //MARK: - todo something
            })
            .disposed(by: bag)
    }
}

//
//  BasicVC.swift
//  Course5
//
//  Created by KietKoy on 28/06/2023.
//

import UIKit
import Foundation
import RxDataSources

class CommandDetailVC: BaseVC<CommandDetailVM> {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func addEventForViews() {
        super.addEventForViews()
        
        
        tableView.rx
            .modelSelected(Command.self)
            .subscribe(onNext: { [weak self] item in
                guard self != nil else { return }
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
    
    override func configureListView() {
        super.configureListView()
        
        tableView.delegate = self
        
        tableView.registerCellNib(CommandCell.self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension CommandDetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        58
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
}


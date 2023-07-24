//
//  FavoriteVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit
import RxSwift
import RxDataSources

class FavoriteVC: BaseVC<FavoriteVM> {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FavoriteVM()
        bindViewModel()
        viewModel.trigger.accept(())
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()
        
        tableView.delegate = self
        tableView.registerCellNib(ItemCell.self)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.mineCraftsS.asObservable()
            .map{ [SectionModel(model: (), items: $0)] }
            .bind(to: self.tableView.rx.items(dataSource: getMineCraftsDatasources()))
            .disposed(by: bag)
    }
    
}

extension FavoriteVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        do {
            let selectedMineCraft: MineCraft = try tableView.rx.model(at: indexPath)
            let detailVM = DetailVM(selectedMineCraft)
            let vc = DetailVC.instantiate(viewModel: detailVM)
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            
        }
    }
}

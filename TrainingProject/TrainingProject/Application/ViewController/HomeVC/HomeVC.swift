//
//  HomeVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: BaseVC<HomeVM> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeVM()
        bindViewModel()
        viewModel.trigger.accept(())
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()

        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0)
        
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

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        cells[indexPath.row].selectionStyle = .none
        do {
            let selectedMineCraft: MineCraft = try tableView.rx.model(at: indexPath)
            let detailVM = DetailVM(selectedMineCraft)
            let vc = DetailVC.instantiate(viewModel: detailVM)
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            
        }
    }
    
}

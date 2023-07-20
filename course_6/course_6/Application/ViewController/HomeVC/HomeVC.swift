//
//  HomeVC.swift
//  course_6
//
//  Created by Mobile Dev on 13/07/2023.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: BaseVC<HomeVM> {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewModel.trigger.accept(())
        configureListView()
    }
    
    override func initViews() {
        super.initViews()
    }
    
    override func configureListView() {
        super.configureListView()
        
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)

        navigationController?.navigationBar.isHidden = true
        
        tableView.registerCellNib(CardCell.self)
        tableView.delegate = self
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel?.knotsS.asObservable()
            .map{ [SectionModel(model: (), items: $0)]}
            .bind(to: self.tableView.rx.items(dataSource: getKnotsDatasources()))
            .disposed(by: bag)
    }

}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let selectedKnot: Knot = try tableView.rx.model(at: indexPath)
            let cardDetailVM = CardDetailVM(selectedKnot)
            let vc = CardDetailVC.instantiate(viewModel: cardDetailVM)
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            
        }
    }
}

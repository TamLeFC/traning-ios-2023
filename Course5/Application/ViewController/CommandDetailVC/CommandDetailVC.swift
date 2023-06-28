//
//  BasicVC.swift
//  Course5
//
//  Created by KietKoy on 28/06/2023.
//

import UIKit
import Foundation
class CommandDetailVC: UIViewController {

    var commands:[Command] = []
    var titleText: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        titleLabel.text = titleText
        setupTableView()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        let nib = UINib(nibName: CommandCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CommandCell.identifier)
        tableView.reloadData()
    }
}
extension CommandDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        commands.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        58
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommandCell.identifier, for: indexPath) as! CommandCell
        cell.configureCell(commands[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        16
    }
}

extension CommandDetailVC: UITableViewDelegate {
    
}

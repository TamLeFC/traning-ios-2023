//
//  CommandVC.swift
//  Course5
//
//  Created by Mobile Dev 1 on 27/06/2023.
//

import UIKit

class CommandVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    
    private let category: Category
    
    private var viewModel: CommandVM!
    
    init(_ category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CommandVM(category)
        
        initViews()
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
        itemTableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

extension CommandVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.commands.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommandTableViewCell", for: indexPath) as! CommandTableViewCell
        cell.configure(viewModel.commands[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

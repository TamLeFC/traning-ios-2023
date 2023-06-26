//
//  CommandVC.swift
//  course2
//
//  Created by Sơn Lê on 21/05/2023.
//

import UIKit

class CommandVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
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
        let identifier = "CommandCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CommandVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: -- todo something here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommandCell", for: indexPath) as! CommandCell
        cell.configure(viewModel.commands[indexPath.row])
        return cell
    }
    
}

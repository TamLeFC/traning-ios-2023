//
//  VoiceVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import UIKit

class VoiceVC: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let category: Category
    
    private var viewModel: VoiceVM!
    
    init(_ category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = VoiceVM(category)
        
        initViews()
    }
    
    private func initViews() {
        titleLabel.text = category.displayName
        setupTableView()
    }
    
    private func setupTableView() {
        let identifier = "VoiceCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension VoiceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: -- todo something here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoiceCell", for: indexPath) as! VoiceCell
        cell.configure(viewModel.commands[indexPath.row])
   
        return cell
    }
}


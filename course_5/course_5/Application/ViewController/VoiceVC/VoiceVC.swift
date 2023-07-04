//
//  VoiceVC.swift
//  course_5
//
//  Created by Mobile Dev on 26/06/2023.
//

import Foundation
import UIKit

class VoiceVC: BaseVC<VoiceVM> {

    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var category: Category?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        initViews()
    }
    
    override func initViews() {
        super.initViews()
        configureListView()
        updateTitleLabel()
        
        appLabel.font = UIFont(name: "Inter-Medium", size: 16)
    }
    
    override func configureListView() {
        super.configureListView()

        let nib = UINib(nibName: VoiceCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: VoiceCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func bindViewModel() {
        viewModel.category
            .subscribe(onNext: { [weak self] category in
                self?.category = category
                self?.updateTitleLabel()
                self?.tableView.reloadData()
            }).disposed(by: bag)
    }
    
    private func updateTitleLabel() {
        titleLabel.text = category?.displayName
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension VoiceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: -- todo something here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VoiceCell.identifier, for: indexPath) as! VoiceCell
        cell.configure(viewModel.commands[indexPath.row])
        return cell
    }
}

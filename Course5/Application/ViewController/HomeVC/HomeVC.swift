import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var commandCollectionView: UICollectionView!
    private let viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        commandCollectionView.setCollectionViewLayout(layout, animated: true)
        
        let identifier = "HomeCollectionViewCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        commandCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        commandCollectionView.delegate = self
        commandCollectionView.dataSource = self
        
        commandCollectionView.showsVerticalScrollIndicator = false
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryCellSpacing: CGFloat = 16
        let width = (collectionView.frame.width - (categoryCellSpacing * 3) - (collectionView.layoutMargins.right + collectionView.layoutMargins.left)) / 4
        let height = width + 26
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CommandVC(viewModel.categories[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(viewModel.categories[indexPath.row])
        return cell
    }
}

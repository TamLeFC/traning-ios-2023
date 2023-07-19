import UIKit
import RxSwift
import RxCocoa

class BaseVC<VM: BaseVM>: UIViewController {
    
    let bag = DisposeBag()
    
    var viewModel: VM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        configureListView()
        addEventForViews()
        bindViewModel()
    }
    
    open func initViews() { }
    
    open func configureListView() { }
    
    open func addEventForViews() { }
    
    open func bindViewModel() { }
    
    deinit {
        print("deinit :: >>>> \(String(describing: self)) <<<<")
    }
}

extension BaseVC {
    static func instantiate(viewModel: BaseVM) -> Self {
        let vc = self.init()
        if let viewModel = viewModel as? VM {
            vc.viewModel = viewModel
        } else {
            fatalError("View model wrong type or null")
        }
        return vc
    }
    
    static func instantiate(nibName: String) -> Self {
        func instantiateFromNib<T: UIViewController>(nibName: String) -> T {
            return T.init(nibName: String(describing: nibName), bundle: nil)
        }
        
        return instantiateFromNib(nibName: nibName)
    }
}

extension BaseVC {
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

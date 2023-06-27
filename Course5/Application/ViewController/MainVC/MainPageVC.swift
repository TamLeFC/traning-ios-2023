//
//  MainPageVC.swift
//  Course5
//
//  Created by Mobile Dev 1 on 26/06/2023.
//

import UIKit

class MainPageVC: UIPageViewController {

    lazy var pages: [UIViewController] = [HomeVC(), SetupVC()]
    private var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([pages[currentPageIndex]], direction: .forward, animated: false, completion: nil)
    }
    
    func handleChangePage(pageIndex: Int) {
        guard pageIndex != currentPageIndex else { return }
        
        let direction: UIPageViewController.NavigationDirection = pageIndex > currentPageIndex ? .forward : .reverse
        
        setViewControllers([pages[pageIndex]], direction: direction, animated: false, completion: nil)
        
        currentPageIndex = pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        
        return pages[currentIndex + 1]
    }
}

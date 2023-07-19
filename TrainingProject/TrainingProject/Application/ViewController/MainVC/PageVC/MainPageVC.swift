//
//  MainPageVC.swift
//  TrainingProject
//
//  Created by Mobile Dev on 17/07/2023.
//

import UIKit

class MainPageVC: UIPageViewController {
    lazy var pages: [UIViewController] = [HomeVC(), FavoriteVC(), SettingVC()]
    
    private var currentPageIndex = 0
    
    func handleUIChangePage(pageIndex: Int) {
        if pageIndex == currentPageIndex { return }
        
        var direction = NavigationDirection.forward
        if pageIndex < currentPageIndex {
            direction = .reverse
        }
        
        setViewControllers(
            [pages[pageIndex]],
            direction: direction,
            animated: false)
        
        currentPageIndex = pageIndex
    }
}

extension MainPageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        guard pages.indices ~= previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        
        guard pages.indices ~= nextIndex else { return nil }
        
        return pages[nextIndex]

    }
}

//
//  mainPageVC.swift
//  Trainning Project
//
//  Created by KietKoy on 17/07/2023.
//

import Foundation

import UIKit
class MainPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let homeVC = HomeVC.instantiate(viewModel: HomeVM())
    let favoriteVC = FavoriteVC.instantiate(viewModel: FavoriteVM())
    let settingVC = SettingVC.instantiate(viewModel: SettingVM())
    
    lazy var pages: [UIViewController] = [homeVC, favoriteVC, settingVC]
    
    private var currentPageIndex = -1
    
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
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        // ~= check if value range
        guard pages.indices ~= previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        
        guard pages.indices ~= nextIndex else { return nil }
        
        return pages[nextIndex]
    }
}

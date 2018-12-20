//
//  RootPageViewController.swift
//  howtosoftwareengineer
//
//  Created by Kim McIver on 11/12/18.
//  Copyright © 2018 Kimberly McIver. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList:[UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "ResourcesVC")
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "CareerProgressionVC")
        let vc3 = storyBoard.instantiateViewController(withIdentifier: "MainScreenVC")
        let vc4 = storyBoard.instantiateViewController(withIdentifier: "MatchVC")
        let vc5 = storyBoard.instantiateViewController(withIdentifier: "DirectMessagesVC")
        
        return [vc1, vc2, vc3, vc4, vc5]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }

}

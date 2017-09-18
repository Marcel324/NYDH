//
//  registrationViewController.swift
//  NYDH
//
//  Created by Marcel Chaucer on 9/13/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

class registrationViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    

    var testViewControllers = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController"), UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController"), UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([testViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    // MARK: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = testViewControllers.index(of: viewController as! questionsViewController) else {
            return nil
        }
    
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return testViewControllers.last
        }
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard testViewControllers.count > previousIndex else {
            return nil
        }
        
        return testViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = testViewControllers.index(of: viewController as! questionsViewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        
        let orderedViewControllersCount = testViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return testViewControllers.first
        }
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return testViewControllers[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return testViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

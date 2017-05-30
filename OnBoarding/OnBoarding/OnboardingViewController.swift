//
//  OnboardingViewController.swift
//  OnBoarding
//
//  Created by Alfonz Montelibano on 5/30/17.
//  Copyright © 2017 alphonsus. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

	lazy var viewControllerList: [UIViewController] = {
		let vc1 = self.storyboard!.instantiateViewController(withIdentifier: "Feature1")
		let vc2 = self.storyboard!.instantiateViewController(withIdentifier: "Feature2")
		let vc3 = self.storyboard!.instantiateViewController(withIdentifier: "Feature3")
		
		return [vc1, vc2, vc3]
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let firstViewController = viewControllerList.first {
			setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
		}
		
		// PageViewController data source and delegate
		self.dataSource = self
		self.delegate = self
		
		// Page Control colors
		let pageControl: UIPageControl = UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingViewController.self])
		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8884212375, green: 0.3416669965, blue: 0.2944744527, alpha: 1)
    }
	
	// MARK: Page view delegate
	func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
		print(pendingViewControllers.first!.restorationIdentifier!)
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		print("\(previousViewControllers.first!.restorationIdentifier!) \(finished) \(completed)")
	}
	
	// MARK: Page view data source
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
	
		guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
		
		let nextIndex = vcIndex + 1
		
		guard viewControllerList.count != nextIndex else { return nil }
		guard viewControllerList.count > nextIndex else { return nil }
		
		return viewControllerList[nextIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

		guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
		
		let previousIndex = vcIndex - 1
		
		guard previousIndex >= 0 else { return nil }
		guard viewControllerList.count > previousIndex else { return nil }
		
		return viewControllerList[previousIndex]
	}
	
	// Display page control
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return viewControllerList.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		return 0
	}
}

//
//  OnboardingPageViewController.swift
//  OnBoarding
//
//  Created by Alfonz Montelibano on 5/30/17.
//  Copyright © 2017 alphonsus. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		wiggleImage()
	}
	
	func wiggleImage() {
		UIView.animate(withDuration: 0.1, animations: {
			// rotate and scale up slightly
			self.imageView.transform = CGAffineTransform(rotationAngle: 0).scaledBy(x: 1.2, y: 1.2)
		}, completion: { finished in
			UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
				// rotate back to original
				self.imageView.transform = CGAffineTransform.identity
			}, completion: nil)
		})
	}
	
	func fadeInTexts(){
//		titleLabe
	}
}

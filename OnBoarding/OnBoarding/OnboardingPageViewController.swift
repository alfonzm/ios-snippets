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
		
		titleLabel.alpha = 0
		subtitleLabel.alpha = 0
    }
	
	override func viewDidAppear(_ animated: Bool) {
		animateImage()
		animateTexts()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		titleLabel.alpha = 0
		subtitleLabel.alpha = 0
	}
	
	func animateImage() {
		UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
			// rotate and scale up slightly
			self.imageView.transform = CGAffineTransform(rotationAngle: 0).scaledBy(x: 1.1, y: 1.1)
		}, completion: { finished in
			self.revertImage()
		})
	}
	
	func revertImage() {
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
			// rotate back to original
			self.imageView.transform = CGAffineTransform.identity
		}, completion: nil)
	}
	
	func animateTexts(){
		// animate alpha and position
		
		titleLabel.alpha = 0.00
		subtitleLabel.alpha = 0.00
		
		titleLabel.transform = CGAffineTransform(translationX: 0, y: -10)
		subtitleLabel.transform = CGAffineTransform(translationX: 0, y: -10)
		
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 30, options: .curveEaseIn, animations: {
			self.titleLabel.alpha = 1.00
			self.titleLabel.transform = CGAffineTransform.identity
		}, completion: nil)
		
		UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 30, options: .curveEaseIn, animations: {
			self.subtitleLabel.alpha = 1.00
			self.subtitleLabel.transform = CGAffineTransform.identity
		}, completion: nil)
	}
}

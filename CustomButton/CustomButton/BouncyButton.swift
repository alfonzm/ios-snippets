//
//  BouncyButton.swift
//  CustomButton
//
//  Created by Alfonz Montelibano on 5/28/17.
//  Copyright © 2017 alphonsus. All rights reserved.
//

import UIKit

class BouncyButton: DesignableButton {
	@IBInspectable var scaleTarget: CGFloat = 0.9
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.bounce()
		super.touchesBegan(touches, with: event)
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.revertScale()
		super.touchesBegan(touches, with: event)
	}
	
	private func bounce() {
		UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
			
			self.transform = CGAffineTransform(scaleX: self.scaleTarget, y: self.scaleTarget)
		}, completion: nil)
	}
	
	private func revertScale() {
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
			self.transform = CGAffineTransform.identity
		}, completion: nil)
	}
}

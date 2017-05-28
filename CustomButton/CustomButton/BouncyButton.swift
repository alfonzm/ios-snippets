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
	
	// If true, button will bounce right away even when holding
	// If false, button will only bounce on touch release
	@IBInspectable var immediate: Bool = false
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.bounce()
		
		if immediate {
			self.revertScale()
		}
		
		super.touchesBegan(touches, with: event)
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !immediate {
			self.revertScale()
		}
		super.touchesBegan(touches, with: event)
	}
	
	private func bounce() {
		self.transform = CGAffineTransform(scaleX: self.scaleTarget, y: self.scaleTarget)
	}
	
	private func revertScale() {
		UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
			self.transform = CGAffineTransform.identity
		}, completion: nil)
	}
}

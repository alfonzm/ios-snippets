//
//  DesignableButton.swift
//  CustomButton
//
//  Created by Alfonz Montelibano on 5/28/17.
//  Copyright © 2017 alphonsus. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
	@IBInspectable var borderWidth: CGFloat = 0.0 {
		didSet {
			self.layer.borderWidth = borderWidth
		}
	}
	
	@IBInspectable var borderColor: UIColor = UIColor.clear {
		didSet {
			self.layer.borderColor = borderColor.cgColor
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat = 0 {
		didSet {
			self.layer.cornerRadius = cornerRadius
		}
	}
}

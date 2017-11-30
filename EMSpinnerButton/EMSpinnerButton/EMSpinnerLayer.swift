//
//  EMLoadingIndicatorLayer.swift
//  ButtonAnimation
//
//  Created by Eduardo Moll on 11/22/17.
//  Copyright © 2017 Eduardo Moll. All rights reserved.
//

import UIKit

internal class EMSpinnerLayer: CAShapeLayer {
  
  internal var color: CGColor? = UIColor.white.cgColor {
    willSet {
      strokeColor = newValue
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init(frame: CGRect) {
    super.init()
    setUp(frame: frame)
  }
}

// MARK: - Setup
internal extension EMSpinnerLayer {
  
  func setUp(frame: CGRect) {
    self.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
    let center = CGPoint(x: frame.height/2, y: frame.height/2)
    
    let circlePath = UIBezierPath(arcCenter: center, radius: 10, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
    
    path = circlePath.cgPath
    lineWidth = 2.0
    strokeColor = color
    fillColor = UIColor.clear.cgColor
    
    self.isHidden = true
  }
}

// MARK: - Animation Methods
internal extension EMSpinnerLayer {

  func startAnimation() {
    let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
    strokeStartAnimation.fromValue = -0.5
    strokeStartAnimation.toValue = 1.0
    
    let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
    strokeEndAnimation.fromValue = 0.0
    strokeEndAnimation.toValue = 1.0
    
    let animationGroup = CAAnimationGroup()
    animationGroup.duration = 1
    animationGroup.repeatCount = .infinity
    animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
    
    add(animationGroup, forKey: nil)
  }
  
  func stopAnimation() {
    removeAllAnimations()
  }
}

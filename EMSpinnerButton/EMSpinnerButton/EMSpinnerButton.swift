//
//  EMLoadingButton.swift
//  ButtonAnimation
//
//  Created by Eduardo Moll on 11/22/17.
//  Copyright © 2017 Eduardo Moll. All rights reserved.
//


import UIKit

public enum AnimationType {
  
  /// Collapse animation will make the button round and show the spinner
  case collapse
  /// Expand animation will make the button go back to the defaults, use after button is "collapsed"
  case expand
  /// Shake animation will shake the button
  case shake
}

extension CAGradientLayer {
  convenience init(frame: CGRect) {
    self.init()
    self.frame = frame
  }
}

@IBDesignable
open class EMSpinnerButton: UIButton {
  // MARK: - Properties
  internal var storedTitle: String?
  internal var animationDuration: CFTimeInterval = 0.1
  
  /// Sets the button corner radius
  @IBInspectable public var cornerRadius: CGFloat = 0 {
    willSet {
      layer.cornerRadius = newValue
    }
  }
  
  /// Sets the duration of the animations
  @IBInspectable public var duration: Double = 0.2 {
    willSet {
      animationDuration = newValue
    }
  }
  
  internal lazy var spinner: EMSpinnerLayer = {
    let spiner = EMSpinnerLayer(frame: self.frame)
    self.layer.addSublayer(spiner)
    return spiner
  }()
  
  internal lazy var gradientLayer: CAGradientLayer = {
    let gradient = CAGradientLayer(frame: self.frame)
    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    layer.insertSublayer(gradient, at: 0)
    return gradient
  }()
  
  /// Sets the spinner color
  public var spinnerColor:CGColor? {
    willSet {
      spinner.color = newValue
    }
  }
  
  /// Sets the colors for the gradient backgorund
  public var gradientColors: [CGColor]? {
    willSet {
      gradientLayer.colors = newValue
    }
  }
  
  /// Sets the button title for its normal state
  public var title: String? {
    get {
      return self.title(for: .normal)
    }
    set {
      self.setTitle(newValue, for: .normal)
    }
  }
  
  /// Sets the button title color.
  public var titleColor: UIColor? {
    get {
      return self.titleColor
    }
    set {
      self.setTitleColor(newValue, for: .normal)
    }
  }

  // MARK: - Initializers
  public required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    setUp()
  }
  
  public init(title: String) {
    super.init(frame: .zero)
    setTitle(title, for: .normal)
    setUp()
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = self.bounds
    clipsToBounds = true
  }
}

internal extension EMSpinnerButton {
  internal func setUp() {
    self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    self.backgroundColor = .emLightBlue
    self.titleColor = .white
  }
}

// MARK: - Animation Methods
internal extension EMSpinnerButton {
  
  internal func collapseAnimation() {
    storedTitle = title
    title = ""
    isUserInteractionEnabled = false
    
    let animaton = CABasicAnimation(keyPath: "bounds.size.width")
    animaton.fromValue = frame.width
    animaton.toValue =  frame.height
    animaton.duration = animationDuration
    animaton.fillMode = kCAFillModeForwards
    animaton.isRemovedOnCompletion = false
    
    layer.add(animaton, forKey: animaton.keyPath)
    spinner.isHidden = false
    spinner.startAnimation()
  }
  
  internal func backToDefaults() {
    
    spinner.stopAnimation()
    setTitle(storedTitle, for: .normal)
    isUserInteractionEnabled = true
    
    let animaton = CABasicAnimation(keyPath: "bounds.size.width")
    animaton.fromValue = frame.height
    animaton.toValue = frame.width
    animaton.duration = animationDuration
    animaton.fillMode = kCAFillModeForwards
    animaton.isRemovedOnCompletion = false
    
    layer.add(animaton, forKey: animaton.keyPath)
    spinner.isHidden = true
  }
  
  internal func shakeAnimation() {
    
    UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
      
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: 10, y: 0)
        self.transform = transform
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: -7, y: 0)
        self.transform = transform
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: 5, y: 0)
        self.transform = transform
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: -3, y: 0)
        self.transform = transform
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: 2, y: 0)
        self.transform = transform
      })
      
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1, animations: {
        let transform = CGAffineTransform(translationX: -1, y: 0)
        self.transform = transform
      })
    })
  }
}

// MARK: - Public Methods
public extension EMSpinnerButton {
  
  /**
    Animates the the button with the given animation
   - parameter animation: Type of animation that will be executed
  */
  public func animate(animation: AnimationType) {
    
    switch animation {
      
    case .collapse:
      UIView.animate(withDuration: 0.1, animations: {
        self.layer.cornerRadius = self.frame.height/2
      }, completion: { (completion) in
        self.collapseAnimation()
      })
      
    case .expand:
      UIView.animate(withDuration: 0.1, animations: {
        self.layer.cornerRadius = self.cornerRadius
      }, completion: { (completion) in
        self.backToDefaults()
      })
      
    case .shake:
      shakeAnimation()
    }
  }
}

// MARK: - Custom Colors
internal extension UIColor {
  
  static let emLightBlue = UIColor().lightBlueColor()
  
  private func lightBlueColor() -> UIColor {
    return UIColor(red: 49/255, green: 177/255, blue: 229/255, alpha: 1.0)
  }
}


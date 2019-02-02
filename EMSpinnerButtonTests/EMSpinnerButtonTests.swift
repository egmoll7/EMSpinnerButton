//
//  EMSpinnerButtonTests.swift
//  EMSpinnerButtonTests
//
//  Created by Eduardo Moll on 11/25/17.
//  Copyright © 2017 Eduardo Moll. All rights reserved.
//

import XCTest
@testable import EMSpinnerButton

class EMSpinnerButtonTests: XCTestCase {
  
  var button: EMSpinnerButton!
  
  override func setUp() {
    super.setUp()
    button = EMSpinnerButton(title: "Login")
    button!.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
  }
  
  override func tearDown() {
    super.tearDown()
    button = nil
  }
  
  // MARK: - Title Tests
  func testTitle() {
    button.title = "LOGIN"
    XCTAssertEqual(button.title, "LOGIN", "Button title is not correct")
  }
  
  func testTitleAfterCollapse() {
    button.animate(animation: .collapse)
    XCTAssertEqual(button.title, "Login", "Button title after collapse is not correct")
  }
  
  func testTitleAfterExpand() {
    button.title = "LOGIN"
    button.animate(animation: .collapse)
    button.animate(animation: .expand)
    XCTAssertEqual(button.title, "LOGIN", "Button title after expand is not correct")
  }
  
  // MARK: - Frame Tests
  func testCenterAfterShake() {
    let centerBeforeShake = button.center
    button.animate(animation: .shake)
    XCTAssertEqual(button.center, centerBeforeShake, "Button center after shake animation is not correct")
  }
  
  func testGradientColor() {
    let colors: [CGColor] = [UIColor.lightGray.cgColor, UIColor.darkGray.cgColor]
    button.gradientColors = colors
    XCTAssertEqual(button.gradientLayer.colors as! [CGColor], colors, "Gradient Colors are not equal")
  }
}

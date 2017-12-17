<p align="center">
<img src="https://github.com/egmoll7/EMSpinnerButton/blob/master/Images/EMSpinnerButton.png" alt="Icon"/>
</p>

[![Language](https://img.shields.io/badge/Swift-4-orange.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/v/EMSpinnerButton.svg)]()
[![GitHub stars](https://img.shields.io/github/stars/egmoll7/EMSpinnerButton.svg)](https://github.com/egmoll7/EMSpinnerButton/stargazers)

EMSpinner Button

<p align="center">
  <img src="https://github.com/egmoll7/EMSpinnerButton/blob/master/Images/collapse.gif" alt="Icon" height=400/>
</p>

## Table of Contents
* [Features](#features)
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Customization](#customization)
* [Title](#button-title)
* [Corner Radius](#corner-radius)
* [Title Color](#title-color)
* [Background Color](#background-color)
* [Background Gradient Color](#background-gradient-color)
* [Spinner Color](#spinner-color)
* [License](#license)

## Features
* [x] Title
* [x] Gradient Background (Optional)
* [x] Various animations
* [x] Fully Customizable
* [x] CocoaPods

## Requirements
* iOS 9.0+
* Xcode 9+

## Installation
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate EMSpinnerButton into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'EMSpinnerButton'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
In the storyboard add a UIButton and change its class to EMSpinnerButton

### Animations

### Collapse
```swift
// Collapse animation
button.animate(animation: .collapse)
```
----------------

### Expand
```swift
// Expand animation
button.animate(animation: .expand)
```
----------------

### Shake
```swift
// Shake animation
button.animate(animation: .shake)
```

## Customization

### Button Title
```swift
button.title = "LOGIN"
// Default title = nil
```

### Corner Radius
```swift
button.cornerRadius = button.frame.height/2
// Default corner radius = 0
```

### Title Color
```swift
button.titleColor = UIColor.red
// Default color = UIColor.white
```

### Background Color
```swift
button.backgroundColor = UIColor.white
// Default color = UIColor(red: 49/255, green: 177/255, blue: 229/255, alpha: 1.0)
```

### Background Gradient Color
```swift
button.gradientColor = UIColor.white
// Default colors = nil
```

### Spinner Color
```swift
button.spinnerColor = UIColor.lightGray.cgColor
// Default color = UIColor.white.cgColor
```

## License
----------------
EMSpinnerButton is available under the MIT license. See the LICENSE file for more info.

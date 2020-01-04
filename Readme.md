### Common

- Constants

- Extensions

- Helpers

- Models

- Libraries

  (Some libraries or code pieces that doesn't have a pod file goes here)

### Infrastructure

- Networking

  - Service

    BaseService class, `LTService.swift'

  - Alamofire+RxSwift

    This folder has a network client for Github by using Alamofire and RxSwift library.

  - Native

    This folder has network client for MarvelAPI by using only native libraries.

- Logging

### Presentation

- Constants

- Controls
  
  Base UIKit or UI related classes like down below
  
  - LTButton.swift
  - LTLabel.swift
  - ...
  
- Extensions
  - LTViewController+ActivityIndicator.swift
  - UIImageView+AlamofireImage.swift
  - ...
  
- Models
  
  - LTViewPropertyAnimator.swift
  
- ViewControllers 
  
  - LTViewController.swift
  
- ViewModels
  
  - LTViewModels.swift
  
- Views 
  
  Base UIKit or UI related classes like down below
  
  - LTCollectionView.swift
  - LTCollectionViewCell.swift
  - LTWindow.swift

### Screens

- EmptyDataSet

  - ViewModels 
  - ViewControllers 
  - Controls ( if it is needed)
  - Models (If it is needed)
  - ViewControllers (Activities)
  - Views (Fragments, if it is needed)

- FoldingCell

- GradientLoadingBar

- Main

- NativeAPI

- RxSwift

- Splash

- StretchyHeader

- SwiftUI

  This directory contains a demo app written by SwiftUI

### Others

* AppDelegate.swift

* AppDelegateViewModel.swift

* Application.swift

* Navigation.swift

  This class has codes for setting up classes for navigation and injecting them in the beginning.

* Assests (Images, Icons)

### Configurations

* Development.xcconfig
* Test.xcconfig
* Production.xcconfig
## PrototypeApp

This is a project to test some popular libraries and as well as trending architectures. 

There will be a menu when the app launches and you can navigate to other views to tryout libraries etc.



### Project Structures

#### Screens

- EmptyDataSet

  - ViewModels 
  - ViewControllers 
  - Controls ( if it is needed)
  - Models (If it is needed)
  - ViewControllers (Activities)
  - Views (Fragments, if it is needed)

  <img src="" alt="EmptyDataSet" style="zoom:50%;" />

- FoldingCell

  <img src="" alt="FoldingCell" style="zoom:50%;" />

- GradientLoadingBar

  <img src="" alt="GradientLoadingBar" style="zoom:50%;" />

  <img src="" alt="GradientLoadingBar2" style="zoom:50%;" />

- NativeAPI

  <img src="" alt="NativeAPI" style="zoom:50%;" />

  <img src="" alt="NativeAPI" style="zoom:50%;" />

  <img src="" alt="NativeAPI" style="zoom:50%;" />

- RxSwift

  <img src="" alt="RxSwift" style="zoom:50%;" />

- StretchyHeader

  <img src="" alt="StretchyHeader" style="zoom:50%;" />

- SwiftUI

  This directory contains a demo app written by SwiftUI

  <img src="" alt="EmptyDataSet" style="zoom:50%;" />

  <img src="" alt="EmptyDataSet" style="zoom:50%;" />

- Splash

- Main

#### Common

- Constants

- Extensions

- Helpers

- Models

- Libraries

  (Some libraries or code pieces that doesn't have a pod file goes here)

#### Infrastructure

- Networking

  - Service

    BaseService class, `LTService.swift'

  - Alamofire+RxSwift

    This folder has a network client for Github by using Alamofire and RxSwift library.

  - Native

    This folder has network client for MarvelAPI by using only native libraries.

- Logging

#### Presentation

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

#### Others

* AppDelegate.swift

* AppDelegateViewModel.swift

* Application.swift

* Navigation.swift

  This class has codes for setting up classes for navigation and injecting them in the beginning.

* Assests (Images, Icons)

#### Configurations

​	This directory has `.xcconfig` files with parameters for every environment such as below.

* Development.xcconfig
* Test.xcconfig
* Production.xcconfig
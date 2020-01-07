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

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/EmptyDateSet.gif" alt="EmptyDataSet" style="zoom:50%;" />

- FoldingCell

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/FoldingCell.gif" alt="FoldingCell" style="zoom:50%;" />

- GradientLoadingBar

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/GradientLoadingBar.gif" alt="GradientLoadingBar" style="zoom:50%;" />

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/GradientOthers.gif" alt="GradientLoadingBar2" style="zoom:50%;" />

- NativeAPI

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/List.gif" alt="NativeAPI" style="zoom:50%;" />

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/ListDetail.gif" alt="NativeAPI" style="zoom:50%;" />

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/Search.gif" alt="NativeAPI" style="zoom:50%;" />

- RxSwift

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/RxSwiftAlamofire.gif" alt="RxSwift" style="zoom:50%;" />

- StretchyHeader

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/StretchyHeader.gif" alt="StretchyHeader" style="zoom:20%;" />

- SwiftUI

  This directory contains a demo app written by SwiftUI

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/SwiftUIMainPage.gif" alt="SwiftUIMain" style="zoom:20%;" />

  <img src="https://raw.githubusercontent.com/flyingBear66/LibrariesPrototype/feature/gifs_for_readme/gifs/CreateEvent.gif" alt="CreateEvent" style="zoom:20%;" />

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

//
//  LTGradientBarButton.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 24/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import GradientLoadingBar

enum GradientLoadingBarType {
    case bottom
    case top
}

class LTGradientBarButton: LTView {
    
    // MARK: - UIControls
    var gradientLoadingBar: GradientLoadingBar?
    
    var title: String {
        get {
            return button.titleLabel?.text ?? "Default"
        }
        set {
            button.setTitle(newValue, for: .normal)
        }
    }
    
    var type: GradientLoadingBarType = .top {
        didSet {
            updateGradientLoadingBar()
        }
    }
    
    var gradientColorList: [UIColor] = [#colorLiteral(red: 0.9490196078, green: 0.3215686275, blue: 0.431372549, alpha: 1), #colorLiteral(red: 0.9450980392, green: 0.4784313725, blue: 0.5921568627, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.737254902, blue: 0.7843137255, alpha: 1), #colorLiteral(red: 0.4274509804, green: 0.8666666667, blue: 0.9490196078, alpha: 1), #colorLiteral(red: 0.7568627451, green: 0.9411764706, blue: 0.9568627451, alpha: 1)] {
        didSet {
            updateGradientLoadingBar()
        }
    }
    
    var height: Double = GradientLoadingBarConstants.height {
        didSet {
            updateGradientLoadingBar()
        }
    }
    
    var durations: Durations = Durations(fadeIn: 1.0, fadeOut: 1.0, progress: 1.0) {
        didSet {
            updateGradientLoadingBar()
        }
    }
    
    let button: LTButton = {
        let button = LTButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitle("gradientButton", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    func updateGradientLoadingBar() {
        let gradientLoadingBarView: GradientLoadingBar?
        switch type {
        case .top:
            gradientLoadingBarView = GradientLoadingBar(height: height,
                                                        durations:durations,
                                                        gradientColorList:gradientColorList,
                                                        onView: button)
        case .bottom:
            gradientLoadingBarView = BottomGradientLoadingBar(height: height,
                                                              durations:durations,
                                                              gradientColorList: gradientColorList,
                                                              onView: button)
        }

        self.gradientLoadingBar = gradientLoadingBarView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 5
        
        
        addSubview(button)
        button.addConstraints(equalToSuperview())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        gradientLoadingBar?.toggle()
    }
}

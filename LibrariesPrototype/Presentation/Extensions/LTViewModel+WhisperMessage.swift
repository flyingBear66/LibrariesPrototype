
//
//  LTViewModel+WhisperMessage.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation
import Whisper

enum WhisperMessageType {
    case whisper
    case shout
    case whistle
}

extension LTViewModel {

    func showMessage(withType type: WhisperMessageType) {
        switch type {
        case .whisper:
            showWhisper()
        case .shout:
            showShout()
        case .whistle:
            showWhistle()
        }
    }

    private func showWhisper() {
        let message = Message(title: "Enter your message here.", backgroundColor: .red)


        guard let viewController = Session.shared.currentViewController else {
            return
        }

        // Show and hide a message after delay
//        Whisper.show(whisper: message, to: navigationController, action: .show)

        guard let navigationController = viewController.navigationController else {
            return
        }

        // Present a permanent message
        Whisper.show(whisper: message, to: navigationController)

        // Hide a message
        Whisper.hide(whisperFrom: navigationController)
    }

    private func showShout() {

        guard let viewController = Session.shared.currentViewController else {
            return
        }

        guard let navigationController = viewController.navigationController else {
            return
        }
        
        let announcement = Announcement(title: "Your title", subtitle: "Your subtitle", image: UIImage(named: "avatar"))
        Whisper.show(shout: announcement, to: navigationController, completion: {
            print("The shout was silent.")
        })
    }

    private func showWhistle() {
        let murmur = Murmur(title: "This is a small whistle...")

        // Show and hide a message after delay
//        Whisper.show(whistle: murmur, action: .show(0.5))

        // Present a permanent status bar message
        Whisper.show(whistle: murmur, action: .present)

        // Hide a message
        Whisper.hide(whistleAfter: 3)
    }
}

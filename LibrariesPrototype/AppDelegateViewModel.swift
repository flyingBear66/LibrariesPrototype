//
//  AppDelegateViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 05/05/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import AlamofireNetworkActivityLogger
import CocoaLumberjack
import Foundation
import HockeySDK

class AppDelegateViewModel: LTViewModel {

    func setupLibrariesOnLaunch() {
        self.setupCocoaLumberjackLogger()
        DDLogInfo("Setting Up Libraies on Launch")
        self.setupAlamofireNetworkLogger()
        self.setupHockeyApp()
    }
    
    private func setupCocoaLumberjackLogger() {
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        DDLogInfo("Setting Up Cocoa Lumber Jack Logger")
        
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    private func setupAlamofireNetworkLogger() {
        DDLogInfo("Setting Up Alamofire Network Activity Logger")
        NetworkActivityLogger.shared.startLogging()
    }
    
    private func setupHockeyApp() {
        BITHockeyManager.shared().configure(withIdentifier: "7c63f562e7794748959c394ed253af9b")
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
    }
    
}

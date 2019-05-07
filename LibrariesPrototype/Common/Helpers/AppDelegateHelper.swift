//
//  AppDelegateHelper.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 25/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import AlamofireNetworkActivityLogger
import CocoaLumberjack
import Foundation

struct AppDelegateHelper {
    
    static func setupLibrariesOnLaunch() {
        AppDelegateHelper.setupCocoaLumberjackLogger()
        DDLogInfo("Setting Up Libraies on Launch")
        AppDelegateHelper.setupAlamofireNetworkLogger()
    }
    
    private static func setupCocoaLumberjackLogger() {
        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        DDLogInfo("Setting Up Cocoa Lumber Jack Logger")

        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    private static func setupAlamofireNetworkLogger() {
        DDLogInfo("Setting Up Alamofire Network Activity Logger")
        NetworkActivityLogger.shared.startLogging()
    }
    

}

//
//  AppDelegate.swift
//  JXLook
//
//  Created by Yung-Luen Lan on 2021/1/18.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        Swift.print("JXLook \(version) (\(build))")
        let copyright = dictionary["NSHumanReadableCopyright"] as! String
        Swift.print(copyright)
        Swift.print("Using libjxl \(JPEGXL_MAJOR_VERSION).\(JPEGXL_MINOR_VERSION).\(JPEGXL_PATCH_VERSION)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


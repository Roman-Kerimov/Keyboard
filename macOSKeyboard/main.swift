//
//  main.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-10.
//

import AppKit

let application = NSApplication.shared
NSApp.setActivationPolicy(.accessory)
application.delegate = AppDelegate.init()

application.run()


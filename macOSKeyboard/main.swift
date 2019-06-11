//
//  main.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-10.
//

import AppKit

//LaunchAgent.load()

let application = NSApplication.shared
NSApp.setActivationPolicy(.prohibited)

private let appDelegate = AppDelegate.init()
application.delegate = appDelegate

application.run()


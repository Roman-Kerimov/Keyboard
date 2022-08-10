//
//  LaunchAgent.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-04-20.
//

import AppKit

struct LaunchAgent {
    private init() {}
    
    private static var plistURL: URL {
        return URL(string: NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!)!
            .appendingPathComponent("LaunchAgents")
            .appendingPathComponent(Bundle.main.bundleIdentifier! + ".plist")
    }
    
    private static func launchctl(_ arguments: String...) -> Bool {
        let process = Process()
        process.launchPath = "/bin/launchctl"
        process.arguments = arguments
        
        let errorPipe = Pipe()
        process.standardError = errorPipe
        
        process.launch()
        process.waitUntilExit()
        
        return errorPipe.fileHandleForReading.readDataToEndOfFile().isEmpty
    }
    
    static func load() {
        let labelKey = "Label"
        let programKey = "Program"
        let plistDictionary = NSDictionary(contentsOfFile: plistURL.absoluteString)
        let plistLabelValue = plistDictionary?[labelKey] as? String
        let plistProgramValue = plistDictionary?[programKey] as? String
        
        if plistLabelValue != Bundle.main.bundleIdentifier || plistProgramValue != Bundle.main.executablePath {
            unload()
            let launchAgentPlistDictionary: [String: Any] = [
                labelKey: Bundle.main.bundleIdentifier!,
                programKey: Bundle.main.executablePath!,
                "RunAtLoad": true,
                "KeepAlive": true,
            ]
            
            NSDictionary(dictionary: launchAgentPlistDictionary)
                .write(toFile: plistURL.absoluteString, atomically: true)
        }
        
        if launchctl("load", plistURL.absoluteString) {
            NSApp.terminate(self)
        }
    }
    
    static func unload() {
        _ = launchctl("unload", plistURL.absoluteString)
    }
}

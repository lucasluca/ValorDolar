//
//  File.swift
//  AutoLauncher
//
//  Created by Lucas Mendes on 10/07/22.
//


import Cocoa

let delegate = AutoLauncherAppDelegate()
NSApplication.shared.delegate = delegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

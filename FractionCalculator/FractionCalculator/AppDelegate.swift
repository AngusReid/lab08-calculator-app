//
//  AppDelegate.swift
//  FractionCalculator
//
//  Created by Angus Reid on 9/5/18.
//  Copyright © 2018 Angus Reid. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
     @IBOutlet weak var display: NSTextField!

    var answerShown = false;
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

  
   
    
    @IBAction func clickDigit(_ sender: NSButton) {
        let digit: Int = sender.tag
        display.stringValue += "\(digit)"
    }
    
    @IBAction func additionButton(_ sender: NSButton) {
        display.stringValue += "+"
    }
    
    @IBAction func subtractionButton(_ sender: NSButton) {
        display.stringValue += "-"
    }
    
    @IBAction func multiplicationButton(_ sender: NSButton) {
        display.stringValue += "*"
    }
    
    @IBAction func divisionButton(_ sender: NSButton) {
        display.stringValue += "/"
    }
    
    @IBAction func clearButton(_ sender: NSButton) {
        display.stringValue = ""
        answerShown = false
    }
    
    
    @IBAction func equalsButton(_ sender: NSButton) {
        if !answerShown {
            if let result = Parser<Fraction>.evaluate(string: display.stringValue) {
                display.stringValue += "=\(result)"
                answerShown = true
            } else {
                display.stringValue = "Error"
            }
        }
    }
    
}


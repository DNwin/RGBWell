//
//  MainWindowController.swift
//  RGBWell
//
//  Created by Dennis Nguyen on 7/10/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

import Cocoa

class MainWindowController : NSWindowController {
    
    var r = 0.0
    var g = 0.0
    var b = 0.0
    let a = 1.0
    
    @IBOutlet weak var colorWell: NSColorWell!
    @IBOutlet weak var rSlider: NSSlider!
    @IBOutlet weak var gSlider: NSSlider!
    @IBOutlet weak var bSlider: NSSlider!
    
    // Required for Cocoa apps unlike iOS
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        rSlider.doubleValue = r
        gSlider.doubleValue = g
        bSlider.doubleValue = b
        
        
        let rSliderSelector = Selector("adjustRed:")
        rSlider.action = rSliderSelector
    }
    
    func adjustRed(sender: NSSlider) {
        println("R slider's value is \(sender.floatValue)")
        r = sender.doubleValue
        updateColor()
    }
    
    @IBAction func adjustBlue(sender: NSSlider) {
        println("B slider's value is \(sender.floatValue)")
        b = sender.doubleValue
        updateColor()
    }

    @IBAction func adjustGreen(sender: NSSlider) {
        println("G slider's value is \(sender.floatValue)")
        g = sender.doubleValue
        updateColor()
    }
    
    func updateColor() {
        let newColor = NSColor(calibratedRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        colorWell.color = newColor
    }


}
//
//  InterfaceController.swift
//  thirdWatchTest WatchKit Extension
//
//  Created by Sergey Bakin on 27.06.17.
//  Copyright © 2017 idleon. All rights reserved.
//

import WatchKit
import Foundation


class HoleThreeInterfaceController: WKInterfaceController {
    
    @IBOutlet var labelPOneCnt: WKInterfaceLabel!
    @IBOutlet var labelPTwoCnt: WKInterfaceLabel!
    
    var pOnecounter : Int!
    var pTwocounter : Int!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pOnecounter = 0
        pTwocounter = 0
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func incrPlayerOneCnt() {
        pOnecounter = pOnecounter + 1
        labelPOneCnt.setText(pOnecounter.description)
        WKInterfaceDevice.current().play(.click)
        
    }
    
    @IBAction func decrPlayerOneCnt() {
        pOnecounter = pOnecounter > 0 ? pOnecounter - 1 : pOnecounter
        labelPOneCnt.setText(pOnecounter.description)
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func incrPlayerTwoCnt() {
        pTwocounter = pTwocounter + 1
        labelPTwoCnt.setText(pTwocounter.description)
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func decrPlayerTwoCnt() {
        pTwocounter = pTwocounter > 0 ? pTwocounter - 1 : pTwocounter
        labelPTwoCnt.setText(pTwocounter.description)
        WKInterfaceDevice.current().play(.click)
    }
}

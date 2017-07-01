//
//  InterfaceController.swift
//  thirdWatchTest WatchKit Extension
//
//  Created by Sergey Bakin on 27.06.17.
//  Copyright © 2017 idleon. All rights reserved.
//

import WatchKit
import Foundation


class HoleFourInterfaceController: WKInterfaceController {
    
    @IBOutlet var labelPOneCnt: WKInterfaceLabel!
    @IBOutlet var labelPTwoCnt: WKInterfaceLabel!
    
    @IBOutlet var incrPlayerOneBtn: WKInterfaceButton!
    @IBOutlet var decrPlayerOneBtn: WKInterfaceButton!
    @IBOutlet var incrPlayerTwoBtn: WKInterfaceButton!
    @IBOutlet var decrPlayerTwoBtn: WKInterfaceButton!
    
    let holeIndex : Int = 3
    var buttonsAreLocked : Bool = false
    
    var model: CounterModel?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let val = context as? [String: CounterModel] {
            model = val["model"]
        }
        labelPOneCnt.setText(model?.getStrokesPlayerOne(hole: holeIndex).description)
        labelPTwoCnt.setText(model?.getStrokesPlayerTwo(hole: holeIndex).description)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func lockButtons(_ sender: WKLongPressGestureRecognizer) {
        if sender.state == WKGestureRecognizerState.possible {
            // Display a Lock icon here.
        } else if sender.state == WKGestureRecognizerState.ended {
            buttonsAreLocked = !buttonsAreLocked
            incrPlayerOneBtn.setEnabled(!buttonsAreLocked)
            decrPlayerOneBtn.setEnabled(!buttonsAreLocked)
            incrPlayerTwoBtn.setEnabled(!buttonsAreLocked)
            decrPlayerTwoBtn.setEnabled(!buttonsAreLocked)
        }
    }
    
    @IBAction func incrPlayerOneCnt() {
        if buttonsAreLocked {
            return
        }
        model?.incrementStrokesPlayerOne(hole: holeIndex)
        labelPOneCnt.setText(model?.getStrokesPlayerOne(hole: holeIndex).description)
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func decrPlayerOneCnt() {
        if buttonsAreLocked {
            return
        }
        model?.decrementStrokesPlayerOne(hole: holeIndex)
        labelPOneCnt.setText(model?.getStrokesPlayerOne(hole: holeIndex).description)
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func incrPlayerTwoCnt() {
        if buttonsAreLocked {
            return
        }
        model?.incrementStrokesPlayerTwo(hole: holeIndex)
        labelPTwoCnt.setText(model?.getStrokesPlayerTwo(hole: holeIndex).description)
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func decrPlayerTwoCnt() {
        if buttonsAreLocked {
            return
        }
        model?.decrementStrokesPlayerTwo(hole: holeIndex)
        labelPTwoCnt.setText(model?.getStrokesPlayerTwo(hole: holeIndex).description)
        WKInterfaceDevice.current().play(.click)
    }
}

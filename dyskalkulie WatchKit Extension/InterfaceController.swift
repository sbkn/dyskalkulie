//
//  InterfaceController.swift
//  dyskalkulie WatchKit Extension
//
//  Created by Sergey Bakin on 28.06.17.
//  Copyright © 2017 idleon. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    var session : WCSession?
    
    let model = CounterModel()
    
    var messages: Array<String> = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.c
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if(WCSession.isSupported()){
            session = WCSession.default()
            session!.delegate = self
            session!.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextsForSegue(withIdentifier segueIdentifier: String) -> [Any]? {
        
        var modelArr = [["model": model, "index": 0]]
        for index in 1...17 {
            modelArr.append(["model": model, "index": index])
        }
        return modelArr
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("%@", "activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    @IBAction func saveData() {
        
        session?.transferUserInfo(["msg" : model.getScoreCard()])
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func resetRound() {
        model.resetRound()
        WKInterfaceDevice.current().play(.click)
    }
}

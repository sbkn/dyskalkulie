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
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return ["model": model]
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("%@", "activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    @IBAction func saveData() {
        
        session?.transferUserInfo(["msg" : model.getScoreCard()])
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func resetRound() {
        
        let acceptResetHandler = {
            self.model.resetRound()
            WKInterfaceDevice.current().play(.click)
        }
        let action1 = WKAlertAction(title: "Reset", style: .destructive, handler: acceptResetHandler)
        let action3 = WKAlertAction(title: "Cancel", style: .cancel) {}
            
        presentAlert(withTitle: "Sure?", message: "", preferredStyle: .actionSheet, actions: [action1,action3])
    }
}

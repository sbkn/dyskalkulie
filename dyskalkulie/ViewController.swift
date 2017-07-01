//
//  ViewController.swift
//  ConnectivityExample
//
//  Created by Ralf Ebert on 11/02/2017.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messages: UILabel!
    
    var connectivityHandler : ConnectivityHandler!
    var counter = 0
    
    @IBAction func sendMessage() {
        counter += 1
        connectivityHandler.session.sendMessage(["msg" : "Message \(counter)"], replyHandler: nil) { (error) in
            NSLog("%@", "Error sending message: \(error)")
        }
    }
    
    @IBAction func updateAppContext() {
        counter += 1
        try! connectivityHandler.session.updateApplicationContext(["msg" : "Message \(counter)"])
    }
    
    @IBAction func transferUserInfo() {
        counter += 1
        connectivityHandler.session.transferUserInfo(["msg" : "Message \(counter)"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.connectivityHandler = (UIApplication.shared.delegate as? AppDelegate)?.connectivityHandler
        self.connectivityHandler?.addObserver(self, forKeyPath: "messages", options: [], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "messages" {
            OperationQueue.main.addOperation {
                self.updateMessages()
            }
        }
    }
    
    func updateMessages() {
        self.messages.text = self.connectivityHandler.messages.joined(separator: "\n")
    }
    
    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }
    
}

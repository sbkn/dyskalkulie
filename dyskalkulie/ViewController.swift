//
//  ViewController.swift
//  ConnectivityExample
//
//  Created by Ralf Ebert on 11/02/2017.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var connectivityHandler : ConnectivityHandler!
    
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
        
    }
    
    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }
    
}

//
//  ViewController.swift
//  ConnectivityExample
//
//  Created by Ralf Ebert on 11/02/2017.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    @IBOutlet weak var lbl9: UILabel!
    @IBOutlet weak var lbl10: UILabel!
    @IBOutlet weak var lbl11: UILabel!
    @IBOutlet weak var lbl12: UILabel!
    @IBOutlet weak var lbl13: UILabel!
    @IBOutlet weak var lbl14: UILabel!
    @IBOutlet weak var lbl15: UILabel!
    @IBOutlet weak var lbl16: UILabel!
    @IBOutlet weak var lbl17: UILabel!
    @IBOutlet weak var lbl18: UILabel!
    
    
    var connectivityHandler : ConnectivityHandler!
    var counter = 0
    
//    @IBAction func sendMessage() {
//        counter += 1
//        connectivityHandler.session.sendMessage(["msg" : "Message \(counter)"], replyHandler: nil) { (error) in
//            NSLog("%@", "Error sending message: \(error)")
//        }
//    }
//    
//    @IBAction func updateAppContext() {
//        counter += 1
//        try! connectivityHandler.session.updateApplicationContext(["msg" : "Message \(counter)"])
//    }
//    
//    @IBAction func transferUserInfo() {
//        counter += 1
//        connectivityHandler.session.transferUserInfo(["msg" : "Message \(counter)"])
//    }
    
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
        self.lbl1.text = "1:\t\t\(self.connectivityHandler.messages[0].description)\t\t|\t\t\(self.connectivityHandler.messages[18].description)"
        self.lbl2.text = "2:\t\t\(self.connectivityHandler.messages[1].description)\t\t|\t\t\(self.connectivityHandler.messages[19].description)"
        self.lbl3.text = "3:\t\t\(self.connectivityHandler.messages[2].description)\t\t|\t\t\(self.connectivityHandler.messages[20].description)"
        self.lbl4.text = "4:\t\t\(self.connectivityHandler.messages[3].description)\t\t|\t\t\(self.connectivityHandler.messages[21].description)"
        self.lbl5.text = "5:\t\t\(self.connectivityHandler.messages[4].description)\t\t|\t\t\(self.connectivityHandler.messages[22].description)"
        self.lbl6.text = "6:\t\t\(self.connectivityHandler.messages[5].description)\t\t|\t\t\(self.connectivityHandler.messages[23].description)"
        self.lbl7.text = "7:\t\t\(self.connectivityHandler.messages[6].description)\t\t|\t\t\(self.connectivityHandler.messages[24].description)"
        self.lbl8.text = "8:\t\t\(self.connectivityHandler.messages[7].description)\t\t|\t\t\(self.connectivityHandler.messages[25].description)"
        self.lbl9.text = "9:\t\t\(self.connectivityHandler.messages[8].description)\t\t|\t\t\(self.connectivityHandler.messages[26].description)"
        self.lbl10.text = "10:\t\t\(self.connectivityHandler.messages[9].description)\t\t|\t\t\(self.connectivityHandler.messages[27].description)"
        self.lbl11.text = "11:\t\t\(self.connectivityHandler.messages[10].description)\t\t|\t\t\(self.connectivityHandler.messages[28].description)"
        self.lbl12.text = "12:\t\t\(self.connectivityHandler.messages[11].description)\t\t|\t\t\(self.connectivityHandler.messages[29].description)"
        self.lbl13.text = "13:\t\t\(self.connectivityHandler.messages[12].description)\t\t|\t\t\(self.connectivityHandler.messages[30].description)"
        self.lbl14.text = "14:\t\t\(self.connectivityHandler.messages[13].description)\t\t|\t\t\(self.connectivityHandler.messages[31].description)"
        self.lbl15.text = "15:\t\t\(self.connectivityHandler.messages[14].description)\t\t|\t\t\(self.connectivityHandler.messages[32].description)"
        self.lbl16.text = "16:\t\t\(self.connectivityHandler.messages[15].description)\t\t|\t\t\(self.connectivityHandler.messages[33].description)"
        self.lbl17.text = "17:\t\t\(self.connectivityHandler.messages[16].description)\t\t|\t\t\(self.connectivityHandler.messages[34].description)"
        self.lbl18.text = "18:\t\t\(self.connectivityHandler.messages[17].description)\t\t|\t\t\(self.connectivityHandler.messages[35].description)"
    }
    
    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }
    
}

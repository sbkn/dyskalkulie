//
//  ScorecardTableViewController.swift
//  dyskalkulie
//
//  Created by Sergey Bakin on 05.07.17.
//  Copyright © 2017 idleon. All rights reserved.
//

import UIKit

class ScorecardTableViewController: UITableViewController {

    var connectivityHandler : ConnectivityHandler!
    @IBOutlet var tableViewRef: UITableView!
    
    var scoreData = [Int](repeating: 0, count: 36)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.connectivityHandler = (UIApplication.shared.delegate as? AppDelegate)?.connectivityHandler
        self.connectivityHandler?.addObserver(self, forKeyPath: "messages", options: [], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "messages" {
            OperationQueue.main.addOperation {
                self.updateMessages()
            }
        }
    }
    
    func updateMessages() {
        scoreData = self.connectivityHandler.messages
        print(self.connectivityHandler.messages[0].description)
        tableViewRef.reloadData()
    }
    
    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hole1", for: indexPath)

        let holeNumber = indexPath.row + 1 + indexPath.section * 9
        
        cell.textLabel?.text = "Hole \(holeNumber)|\t\(scoreData[holeNumber - 1])\t|\t\(scoreData[holeNumber - 1 + 18])"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Half \(section + 1)"
    }

}

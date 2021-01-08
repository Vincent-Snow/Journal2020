//
//  EntryTableViewController.swift
//  Journal2020
//
//  Created by Vincent Snow on 1/4/21.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortEntries()
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedController.entriesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = EntryController.sharedController.entriesArray[indexPath.row]
        
        
        cell.textLabel?.text = entry.subject
        cell.detailTextLabel?.text = "Updated at " + entry.dateToString()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    func sortEntries() {
        EntryController.sharedController.entriesArray = EntryController.sharedController.entriesArray.sorted(by: { $0.timestamp.compare($1.timestamp as Date) == ComparisonResult.orderedDescending })
//        EntryController.sharedController.entriesArray = EntryController.sharedController.entriesArray.sorted(by: { $0.subject > $1.subject })
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.sharedController.entriesArray[indexPath.row]
            EntryController.sharedController.removeEntry(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }   
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEntry" {
            
            if let entryViewController = segue.destination as? EntryViewController {
                _ = entryViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedController.entriesArray[selectedRow]
                    entryViewController.updateWithEntry(entry: entry)
                }
            }
            
            
        }
        
        
    }


}

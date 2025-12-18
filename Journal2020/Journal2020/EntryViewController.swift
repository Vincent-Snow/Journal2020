//
//  EntryViewController.swift
//  Journal2020
//
//  Created by Vincent Snow on 1/4/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var titleOutlet: UITextField!
    @IBOutlet weak var bodyOutlet: UITextView!
    
    var entry: Entry?
    
    @IBAction func saveEntryClicked(_ sender: Any) {

        if let entry = self.entry {
            entry.subject = self.titleOutlet.text!
            entry.body = self.bodyOutlet.text
            entry.timestamp = NSDate()
        } else {
            let newEntry = Entry(timestamp: NSDate(), body: self.bodyOutlet.text, subject:  self.titleOutlet.text!)
            EntryController.sharedController.addEntry(entry: newEntry)
            self.entry = newEntry
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearEntryClicked(_ sender: Any) {
        titleOutlet.text = ""
        bodyOutlet.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }

    func updateWithEntry(entry: Entry) {
        self.entry = entry
        self.titleOutlet.text = entry.subject
        self.bodyOutlet.text = entry.body
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

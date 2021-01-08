//
//  EntryController.swift
//  Journal2020
//
//  Created by Vincent Snow on 1/4/21.
//

import Foundation
class EntryController {
    
    var entriesArray: [Entry]
    
    static let sharedController = EntryController()
    
    init() {
        self.entriesArray = []
    }
    
    func addEntry(entry:Entry) {
        entriesArray.append(entry)
    }
    
    func removeEntry(entry:Entry) {
        if let index = entriesArray.firstIndex(of: entry) {
            entriesArray.remove(at: index)
        }
    }
    
    
}

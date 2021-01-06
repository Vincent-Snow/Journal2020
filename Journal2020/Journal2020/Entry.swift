//
//  Entry.swift
//  Journal2020
//
//  Created by Vincent Snow on 1/4/21.
//

import Foundation

class Entry: Equatable {
    let timestamp: NSDate
    let body: String
    let subject: String
    
    init(timestamp: NSDate = NSDate(), body: String, subject: String) {
        self.timestamp = timestamp
        self.body = body
        self.subject = subject
    }
    
    
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

//
//  Entry.swift
//  Journal2020
//
//  Created by Vincent Snow on 1/4/21.
//

import Foundation

class Entry: Equatable {
    
    var timestamp: NSDate
    var body: String
    var subject: String
    
    init(timestamp: NSDate = NSDate(), body: String, subject: String) {

        self.timestamp = timestamp
        self.body = body
        self.subject = subject
    }
    
//    func string(from: timestamp) -> String {
//        
//    }
//    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: self.timestamp as Date)
    }
    
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

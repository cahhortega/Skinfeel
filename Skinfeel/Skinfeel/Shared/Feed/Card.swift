//
//  Card.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation

struct Card: Codable {
    var id: Int
    var titulo: String
    var site: String
    
    static var cards: [Card] {
        let rc = ReadContent()
        return rc.load(filename: "cards")
        
    }
    static var cardsCf: [Card] {
        let rcCf = ReadContent()
        return rcCf.load(filename: "crueltyFree")
    }
    static var cardsFm: [Card] {
        let rcFm = ReadContent()
        return rcFm.load(filename: "formen")
    }
    static var cardsSc: [Card] {
        let rcSc = ReadContent()
        return rcSc.load(filename: "coreana")
    }
    static var cardsPn: [Card] {
        let rcPn = ReadContent()
        return rcPn.load(filename: "pelenegra")
    }
}



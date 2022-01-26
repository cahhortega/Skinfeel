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
}



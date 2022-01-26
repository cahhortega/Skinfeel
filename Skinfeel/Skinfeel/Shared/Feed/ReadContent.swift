//
//  ReadContent.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
class ReadContent {
    
    func load(filename: String) -> [Card] {
        
        let data: Data
        
        guard let file = Bundle.main.path(forResource: filename, ofType: "json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: file))
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Card].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Card].self):\n\(error)")
        }
    }
}



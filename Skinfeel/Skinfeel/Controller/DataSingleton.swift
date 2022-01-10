//
//  DataSingleton.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import Foundation

class Helper {
    static let shared = Helper()
    
    var objects = SkinTypeViewController()
    private init () {}
    
}

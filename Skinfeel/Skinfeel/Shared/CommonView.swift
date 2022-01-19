//
//  CommonView.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 17/01/22.
//

import Foundation
import UIKit
class CommonView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//Caso vc queira que apareça uma coisa no appclip e uma no app inteiro
        #if APPCLIP
        print("AppClip")
        #else
        print("App inteiro")
        #endif
        
    }
    
}

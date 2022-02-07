//
//  ExploreViewController.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 26/01/22.
//

import Foundation
import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet var bar: UINavigationItem!
    var defaults = UserDefaults.standard
    @IBOutlet var exploreCollectionView: UICollectionView!
    
    private lazy var expDataSource = ExploreCollectionViewDataSource()
    private lazy var expDelegate = ExploreCollectionViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        exploreCollectionView.delegate = expDelegate
        exploreCollectionView.dataSource = expDataSource
        switch defaults.integer(forKey: "botao") {
        case 0:
            //            bar.title = "Cruelty Free"
            bar.title = NSLocalizedString("Cruelty Free", comment: "Cruelty Free")
        case 1:
            //            bar.title = "For men"
            bar.title = NSLocalizedString("For men", comment: "For men")
            
        case 2:
            //            bar.title = "Pele negra"
            bar.title = NSLocalizedString("Black skin", comment: "Black Skin")
            
        case 3:
            //            bar.title = "Skincare Coreana"
            bar.title = NSLocalizedString("Korean Skincare", comment: "Korean Skincare")
            
            
        default:
            print("oi")
        }
        
    }
}

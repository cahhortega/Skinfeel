//
//  SuggestedCollectionViewDelegate.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit

class SuggestedCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    private lazy var exploreView = ExploreViewController()
    var defaults = UserDefaults.standard
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                switch indexPath.row{
                case 0:
                    defaults.set(0, forKey: "botao")

                case 1:
                    defaults.set(1, forKey: "botao")

                case 2:
                    defaults.set(2, forKey: "botao")

                default:
                    defaults.set(3, forKey: "botao")

                }
    }
}

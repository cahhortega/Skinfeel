//
//  ExploreCollectionViewDelegate.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 26/01/22.
//

import Foundation
import UIKit

class ExploreCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var card: Card?
    var cardsCf: [Card] = Card.cardsCf
    var cardsPn: [Card] = Card.cardsPn
    var cardsSc: [Card] = Card.cardsSc
    var cardsFm: [Card] = Card.cardsFm
    var defaults = UserDefaults.standard

    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch defaults.integer(forKey: "botao") {
        case 0:
            let url = NSURL(string: "\(cardsCf[indexPath.row].site)")
            if url != nil{
                UIApplication.shared.open(url! as URL)
            }

        case 1:
            let url = NSURL(string: "\(cardsFm[indexPath.row].site)")
            if url != nil{
                UIApplication.shared.open(url! as URL)
            }

        case 2:
            let url = NSURL(string: "\(cardsPn[indexPath.row].site)")
            if url != nil{
                UIApplication.shared.open(url! as URL)
            }

        case 3:
            let url = NSURL(string: "\(cardsSc[indexPath.row].site)")
            if url != nil{
                UIApplication.shared.open(url! as URL)
            }

        default:
            print("oi")
        }

    }
}

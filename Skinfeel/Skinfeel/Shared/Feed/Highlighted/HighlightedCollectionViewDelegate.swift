//
//  HighlightedCollectionViewDelegate.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit

class HighlightedCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var card: Card?
    var cards: [Card] = Card.cards
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url : NSURL?
                switch indexPath.row{
                case 0:
                    url = NSURL(string: "https://facebook.com")
                case 1:
                    url = NSURL(string: "https://google.com")
                case 2:
                    url = NSURL(string: "https://apple.com")
                default:
                    return;
                }

            if url != nil{
                UIApplication.shared.open(url! as URL)
            }
    }
}

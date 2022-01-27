//
//  NewsCollectionViewDelegate.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit

class NewsCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var card: Card?
    var cards: [Card] = Card.cards
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = NSURL(string: "\(cards[indexPath.row].site)")

            if url != nil{
                UIApplication.shared.open(url! as URL)
            }
    }
}

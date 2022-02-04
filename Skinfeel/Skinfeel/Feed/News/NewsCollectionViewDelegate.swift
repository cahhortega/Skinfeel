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
    var cardsAppClip: [Card] = Card.cardsAppClip
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        #if APPCLIP
        let url = NSURL(string: "\(cardsAppClip[indexPath.row].site)")
        #else
        let url = NSURL(string: "\(cards[indexPath.row].site)")
        #endif
        
            if url != nil{
                UIApplication.shared.open(url! as URL)
            }
    }
}

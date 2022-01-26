//
//  HighlightedCollectionViewDataSource.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit
import SafariServices

class HighlightedCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var card: Card?
    var cards: [Card] = Card.cards
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "high", for: indexPath) as! HighlightedCollectionViewCell
//
//        if indexPath.item == 0 {
//            cell.backgroundColor = .green
        cell.imagem.image = UIImage(named: "\(cards[indexPath.row].id)")
//
//        } else if indexPath.item == 1 {
//            cell.backgroundColor = .purple
//            cell.imagem.image = UIImage(named: "2")
//
//        } else {
//            cell.backgroundColor = .blue
//        }
        return cell
        
        
    }
    
}

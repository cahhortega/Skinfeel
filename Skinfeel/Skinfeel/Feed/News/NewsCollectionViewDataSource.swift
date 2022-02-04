//
//  NewsCollectionViewDataSource.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit
import SafariServices

class NewsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var card: Card?
    var cards: [Card] = Card.cards
    var cardsAppClip: [Card] = Card.cardsAppClip
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        #if APPCLIP
        return cardsAppClip.count
        #else
        return cards.count
        #endif
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "new", for: indexPath) as! NewsCollectionViewCell
        
        #if APPCLIP
        cell.imagem.image = UIImage(named: "\(cardsAppClip[indexPath.row].id)")
        cell.titulo.text = "\(cardsAppClip[indexPath.row].titulo)"
        
        #else
        cell.imagem.image = UIImage(named: "\(cards[indexPath.row].id)")
        cell.titulo.text = "\(cards[indexPath.row].titulo)"
        #endif
        return cell
        
        
    }
    
}

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
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "new", for: indexPath) as! NewsCollectionViewCell
        cell.imagem.image = UIImage(named: "\(cards[indexPath.row].id)")

        cell.titulo.text = "\(cards[indexPath.row].titulo)"
        return cell
        
        
    }
    
}

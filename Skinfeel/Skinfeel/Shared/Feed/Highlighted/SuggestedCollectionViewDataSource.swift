//
//  SuggestedCollectionViewDataSource.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 25/01/22.
//

import Foundation
import UIKit
import SafariServices

class SuggestedCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sug", for: indexPath) as! SuggestedCollectionViewCell
        
        if indexPath.item == 0 {
            cell.imagem.image = UIImage(named: "crueltyfree")
           
                
        } else if indexPath.item == 1 {
            cell.imagem.image = UIImage(named: "men")

        } else if indexPath.item == 3{
            cell.imagem.image = UIImage(named: "corea")

        }
        else {
            cell.imagem.image = UIImage(named: "pelenegra")
        }
        return cell
        
        
    }
    
}

//
//  ExploreCollectionViewDataSource.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 26/01/22.
//

import Foundation
import UIKit
import SafariServices

class ExploreCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var card: Card?
    var cardsCf: [Card] = Card.cardsCf
    var cardsPn: [Card] = Card.cardsPn
    var cardsSc: [Card] = Card.cardsSc
    var cardsFm: [Card] = Card.cardsFm
    var defaults = UserDefaults.standard
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsCf.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exp", for: indexPath) as! ExploreCollectionViewCell
        
        switch defaults.integer(forKey: "botao") {
        case 0:
            cell.imagem.image = UIImage(named: "\(cardsCf[indexPath.row].id)")
            cell.titulo.text = "\(cardsCf[indexPath.row].titulo)"
            
        case 1:
            cell.imagem.image = UIImage(named: "\(cardsFm[indexPath.row].id)")
            cell.titulo.text = "\(cardsFm[indexPath.row].titulo)"
            
        case 2:
            cell.imagem.image = UIImage(named: "\(cardsPn[indexPath.row].id)")
            cell.titulo.text = "\(cardsPn[indexPath.row].titulo)"
            
        case 3:
            cell.imagem.image = UIImage(named: "\(cardsSc[indexPath.row].id)")
            cell.titulo.text = "\(cardsSc[indexPath.row].titulo)"
            
        default:
            print("oi")
        }
        
        return cell
        
    }
}



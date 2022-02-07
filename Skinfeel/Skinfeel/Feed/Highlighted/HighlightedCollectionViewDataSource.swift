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
        
        if indexPath.item == 0 {
            cell.imagem.image = UIImage(named: "high1")
            cell.titulo.text = "Avon é a marca mais comentada do BBB e triplica faturamento no e-commerce"
            
        } else if indexPath.item == 1 {
            cell.imagem.image = UIImage(named: "high2")
            cell.titulo.text = "Pele madura: qual o melhor jeito de cuidar?"

        } else if indexPath.item == 2 {
            cell.imagem.image = UIImage(named: "high3")
            cell.titulo.text = "Consumidor simplifica rotina de skincare e maquiagem no pós-Covid"

        } else{
            cell.imagem.image = UIImage(named: "high4")
            cell.titulo.text = "Skincare em alta na pandemia ajuda a prevenir doenças dermatológicas"

        }
        return cell
        
        
    }
    
}

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
        switch indexPath.row {
        case 0:
            url = NSURL(string: "https://www.b9.com.br/143344/avon-e-a-marca-mais-comentada-do-bbb21-e-triplica-faturamento-no-e-commerce/")
            
        case 1:
            url = NSURL(string: "https://www.sallve.com.br/blogs/sallve/pele-madura")
        case 2:
            url = NSURL(string: "https://guiadafarmacia.com.br/consumidor-simplifica-rotina-de-skincare-e-maquiagem-no-pos-covid/")
        case 3:
            url = NSURL(string: "https://aun.webhostusp.sti.usp.br/index.php/2021/03/24/skincare-em-alta-na-pandemia-ajuda-a-prevenir-doencas-dermatologicas/")
        default:
            return;
        }
        
        if url != nil{
            UIApplication.shared.open(url! as URL)
        }
    }
}

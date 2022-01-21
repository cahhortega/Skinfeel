//
//  FeedViewController.swift
//  Skinfeel
//
//  Created by Carolina Ortega on 21/01/22.
//

import Foundation
import UIKit
import SafariServices

class FeedViewController: UIViewController {
    @IBOutlet var highlightedCollectionView: UICollectionView!
    @IBOutlet var suggestedCollectionView: UICollectionView!
    
    var url = URL(string: "")
    
    var urls: [String] = ["http://www.apple.com", "http://www.mackenzie.com", "http://www.google.com"]
    
    @IBAction func acaoBotao(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        highlightedCollectionView.dataSource = self
        highlightedCollectionView.delegate = self
        highlightedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        highlightedCollectionView.isPagingEnabled = true
        highlightedCollectionView.showsHorizontalScrollIndicator = false
        
        suggestedCollectionView.dataSource = self
        suggestedCollectionView.delegate = self
        suggestedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        suggestedCollectionView.isPagingEnabled = true
        suggestedCollectionView.showsHorizontalScrollIndicator = false
        
    }
}

extension FeedViewController: UICollectionViewDelegate {
    
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == highlightedCollectionView {
            return 3
        } else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == highlightedCollectionView {
            let cell = highlightedCollectionView.dequeueReusableCell(withReuseIdentifier: "high", for: indexPath) as! HighlightedCollectionViewCell
            
            if indexPath.item == 0 {
                cell.backgroundColor = .green
                url = URL(string: urls[indexPath.item])
                
            } else if indexPath.item == 1 {
                cell.backgroundColor = .purple
                url = URL(string: urls[indexPath.item])
                
            } else {
                cell.backgroundColor = .blue
                url = URL(string: urls[indexPath.item])
            }
            return cell
        } else {
            let cell = suggestedCollectionView.dequeueReusableCell(withReuseIdentifier: "sug", for: indexPath) as! SuggestedCollectionViewCell
            return cell
        }
        
    }
}

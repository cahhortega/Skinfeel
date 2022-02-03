//
//  FeedAppClips.swift
//  SkinfeelPartial
//
//  Created by Carolina Ortega on 02/02/22.
//

import Foundation
import UIKit
import SafariServices

class FeedAppClipsViewController: UIViewController {
   // @IBOutlet var highlightedCollectionView: UICollectionView!
    //@IBOutlet var suggestedCollectionView: UICollectionView!
    @IBOutlet var newsCollectionView: UICollectionView!
        
    private lazy var newsDataSource = NewsCollectionViewDataSource()
    private lazy var newsDelegate = NewsCollectionViewDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.topItem?.title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        newsCollectionView.dataSource = newsDataSource
        newsCollectionView.delegate = newsDelegate
        newsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        newsCollectionView.isPagingEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.topItem?.title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
}

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
    @IBOutlet var newsCollectionView: UICollectionView!
    
    private lazy var highDataSource = HighlightedCollectionViewDataSource()
    private lazy var highDelegate = HighlightedCollectionViewDelegate()
    
    private lazy var sugDataSource = SuggestedCollectionViewDataSource()
    private lazy var sugDelegate = SuggestedCollectionViewDelegate()
    
    private lazy var newsDataSource = NewsCollectionViewDataSource()
    private lazy var newsDelegate = NewsCollectionViewDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.topItem?.title = "Feed"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        highlightedCollectionView.dataSource = highDataSource
        highlightedCollectionView.delegate = highDelegate
        highlightedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        highlightedCollectionView.isPagingEnabled = true
        highlightedCollectionView.showsHorizontalScrollIndicator = false
        
        suggestedCollectionView.dataSource = sugDataSource
        suggestedCollectionView.delegate = sugDelegate
        suggestedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        suggestedCollectionView.isPagingEnabled = true
        suggestedCollectionView.showsHorizontalScrollIndicator = false

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

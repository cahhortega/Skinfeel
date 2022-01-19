//
//  ShelfViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 06/12/21.
//

import UIKit

class ShelfViewController: UIViewController {
    
    @IBOutlet var productTableView: UITableView!
    var list: [String] = []
    var searchProduct: [String]!
    let defaults = UserDefaults.standard
    var chosenProducts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        


        
    }
    //reload da tableView
    func reload() {
        self.productTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chosenProducts = defaults.stringArray(forKey: "myKey") ?? []
        print(chosenProducts)
        let sortedProducts = chosenProducts.sorted()
        list = sortedProducts
        reload()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

}

extension ShelfViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estante", for: indexPath) as! ShelfTableViewCell
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

}

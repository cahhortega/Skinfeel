//
//  NewProductShelfViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import Foundation
import UIKit

//DEVE RETORNAR TODA A API

class NewProductShelfViewController: UIViewController{
    @IBOutlet weak var productTableView: UITableView!
    var list: [String]!
    var searchProduct: [String]!
    var selectedProducts: [String]!
    var resultProducts: [String]!
    var myProducts: [String]!
    var filtered: [String]!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchProduct = defaults.stringArray(forKey: "completeTable") ?? []
        print(searchProduct)
        selectedProducts = defaults.stringArray(forKey: "myKey") ?? []
        print(selectedProducts)
        filtered = searchProduct.difference(from: selectedProducts).sorted()
        print(filtered)
        
        list = searchProduct
        navigationItem.setHidesBackButton(false, animated: false)

        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.setHidesBackButton(false, animated: false)
    }
    
    
}

extension NewProductShelfViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = filtered[indexPath.row]
        return cell
    }

    
}





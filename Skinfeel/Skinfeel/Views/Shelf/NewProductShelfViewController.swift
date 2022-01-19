//
//  NewProductShelfViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 14/12/21.
//

import Foundation
import UIKit

class NewProductShelfViewController: UIViewController{
    @IBOutlet weak var productTableView: UITableView!
    var list: [String]!
    var searchProduct: [String]!
    var selectedProducts: [String]!
    var resultProducts: [String]!
    var myProducts: [String]!
    var filtered: [String]!
    let defaults = UserDefaults.standard
    
    @IBAction func saveButton(_ sender: Any) {
        defaults.set(selectedProducts, forKey: "myKey")
        self.navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchProduct = defaults.stringArray(forKey: "completeTable") ?? []
        print("Tabela completa:",searchProduct!)
        selectedProducts = defaults.stringArray(forKey: "myKey") ?? []
        print("Produtos selecionados",selectedProducts!)
        filtered = searchProduct.difference(from: selectedProducts).sorted()
        print("Diferença",filtered!)
        
        list = searchProduct

        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
        
        navigationController?.setNavigationBarHidden(false, animated: false)

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = self.tableView(productTableView, cellForRowAt: indexPath)
            let text = cell.textLabel!.text
            if let text = text {
                NSLog("did select and the text is \(text)")
                if !selectedProducts.contains(text){
                    selectedProducts.append(text)
                    print("Novo array", selectedProducts!)
                }

        }
    }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did deselect and the text is \(text)")
            if let index = selectedProducts.firstIndex(of: text) {
                selectedProducts.remove(at: index)
                print("Novo array", selectedProducts!)
                
            }
            
        }


    }

    
}




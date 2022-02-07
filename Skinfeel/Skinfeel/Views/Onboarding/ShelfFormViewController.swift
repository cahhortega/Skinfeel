//
//  ShelfFormViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class ShelfFormViewController: UIViewController{

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var productTableView: UITableView!
    var searchProduct: [String] = []
    var filteredData: [String]!
    var myProducts: [String] = []
    let defaults = UserDefaults.standard
    var checkedItems = Set<String>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.85
        navigationController?.setNavigationBarHidden(false, animated: false)
        searchProduct = defaults.stringArray(forKey: "completeTable") ?? []
        print(searchProduct)
        

        filteredData = searchProduct

        let sortedProducts = searchProduct.sorted()
        filteredData = sortedProducts
        
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        
        
        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior".localized(),
            style: .plain,
            target: self,
            action: #selector(back)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")


    }
    //Ação do backButton
    @objc func back(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "type") as! SkinTypeViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }


}

extension ShelfFormViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.accessoryType = selectedIndexPaths.contains(indexPath) ? .checkmark : .none
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        if myProducts.contains((cell.textLabel?.text)!){
            print("entrei aqui")
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did select and the text is \(text)")
            if !myProducts.contains(text){
                myProducts.append(text)
                print(myProducts)
            }
            
        defaults.set(myProducts, forKey: "myKey")
    }
}
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did deselect and the text is \(text)")
            if let index = myProducts.firstIndex(of: text) {
                myProducts.remove(at: index)
                print(myProducts)
                
            }
            defaults.set(myProducts, forKey: "myKey")

        }

    }

}


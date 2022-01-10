//
//  NewProductRoutineViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import Foundation
import UIKit

class NewProductRoutineViewController: UIViewController{
    
    @IBOutlet var productTableView: UITableView!
    var list: [String] = []
    var searchProduct: [String]!
    let defaults = UserDefaults.standard
    var chosenProducts: [String] = []
    var array: [String] = [] //trocar!!!
    
    @IBAction func saveButton(_ sender: Any) {
        defaults.setValue(array, forKey: "newArray")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
//        navigationItem.setHidesBackButton(true, animated: false)
        
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        //multi seleção
        self.productTableView.allowsMultipleSelection = true
        self.productTableView.allowsMultipleSelectionDuringEditing = true
        


        
        
    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chosenProducts = defaults.stringArray(forKey: "myKey") ?? []
        print(chosenProducts)
        list = chosenProducts
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    


    }
    

    
extension NewProductRoutineViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produto", for: indexPath) as! ShelfFormTableViewCell
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = self.tableView(productTableView, cellForRowAt: indexPath)
            let text = cell.textLabel!.text
            if let text = text {
                NSLog("did select and the text is \(text)")
                if !array.contains(text){
                    array.append(text)
                    print("Novo array", array)
                }

        }
    }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView(productTableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did deselect and the text is \(text)")
            if let index = array.firstIndex(of: text) {
                array.remove(at: index)
                print(array)
                
            }

        }

    }}
    

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}


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
    let fraseSemRotina = UILabel()
    let imagemBoasVindas = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(fraseSemRotina)
        view.addSubview(imagemBoasVindas)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        imagemBoasVindas.image = UIImage(named: "menina triste")
        imagemBoasVindas.translatesAutoresizingMaskIntoConstraints = false
        
        imagemBoasVindas.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        imagemBoasVindas.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        fraseSemRotina.text = "Clique no botão abaixo para adicionar novos produtos".localized()
        
        fraseSemRotina.numberOfLines = 0
        fraseSemRotina.textAlignment = .center
        fraseSemRotina.textColor = .label
        
        fraseSemRotina.translatesAutoresizingMaskIntoConstraints = false
        fraseSemRotina.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        fraseSemRotina.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        fraseSemRotina.topAnchor.constraint(equalTo: imagemBoasVindas.bottomAnchor, constant: 35).isActive = true
        
        
        //tableView
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        reload()
        numeroDeCelulas()
        
        
        
    }
    //reload da tableView
    func reload() {
        self.productTableView.reloadData()
    }
    
    func numeroDeCelulas() {
        if Int(self.list.count) != 0 { //Colocar aqui a lista de cards
            productTableView.isHidden = false
            fraseSemRotina.isHidden = true
            imagemBoasVindas.isHidden = true
            
        } else {
            productTableView.isHidden = true
            fraseSemRotina.isHidden = false
            imagemBoasVindas.isHidden = false
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chosenProducts = defaults.stringArray(forKey: "myKey") ?? []
        print(chosenProducts)
        let sortedProducts = chosenProducts.sorted()
        list = sortedProducts
        numeroDeCelulas()
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
         return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let apagado = list.remove(at: indexPath.row)
            print("apagou",apagado)
            defaults.set(list, forKey: "myKey")
            print("nova lista", list)
            productTableView.deleteRows(at: [indexPath], with: .fade)
            productTableView.reloadData()
            numeroDeCelulas()
            
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estante", for: indexPath) as! ShelfTableViewCell
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
}

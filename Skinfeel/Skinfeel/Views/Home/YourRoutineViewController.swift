//
//  YourRoutineViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 09/12/21.
//

import Foundation
import UIKit

class YourRoutineViewController: UIViewController {
    
    weak var NewRoutineViewControllerDelegate: NewRoutineViewControllerDelegate?
    @IBOutlet var deleteRoutine: UIBarButtonItem!
    var routine: Routine = Routine()
    weak var YourRoutineViewControllerDelegate: YourRoutineViewControllerDelegate?
    @IBOutlet weak var routineNome: UILabel!
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "", message: "Tem certeza de que deseja deletar esta rotina?", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Apagar", style: .destructive, handler: {(action: UIAlertAction!) in
            //acao de deletar
            _ = try! CoreDataStackRoutine.deleteRoutine(routine: self.routine)
            self.navigationController?.popViewController(animated: true)
        }))
        ac.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
        
        present(ac, animated: true, completion: nil)
        YourRoutineViewControllerDelegate?.didRegister()
    }
    
    @IBOutlet weak var tableView: UITableView!
    var dataFilter = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var defaults = UserDefaults.standard
    var selectedSection: Int?
    var selectedProducts: [String] = []
//
//    var hidratacaoManha: [String] = []
//    var protecaoManha: [String] = []
//    var protecaoTarde: [String] = []
//    var limpezaNoite: [String] = []
//    var esfoliacaoNoite: [String] = []
//    var protecaoNoite: [String] = []
    var nomeRotina = try? CoreDataStackRoutine.getRoutine()
    static var index : Int = -1
    
    @IBAction func saveButton(_ sender: Any) {
//        let somaManha = limpezaManha.count + hidratacaoManha.count + protecaoManha.count
//        let somaTarde = protecaoTarde.count
//        let somaNoite = limpezaNoite.count + esfoliacaoNoite.count + protecaoNoite.count
//        defaults.set(somaManha, forKey: "somaManha")
//        defaults.set(somaTarde, forKey: "somaTarde")
//        defaults.set(somaNoite, forKey: "somaNoite")
        
        defaults.set(true, forKey: "feito")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        limpezaManha = defaults.stringArray(forKey: "limpezaManha")!
//        hidratacaoManha = defaults.stringArray(forKey: "hidratacaoManha")!
//        protecaoManha = defaults.stringArray(forKey: "protecaoManha")!
//        protecaoTarde = defaults.stringArray(forKey: "protecaoTarde")!
//        limpezaNoite = defaults.stringArray(forKey: "limpezaNoite")!
//        esfoliacaoNoite = defaults.stringArray(forKey: "esfoliacaoNoite")!
//        protecaoNoite = defaults.stringArray(forKey: "protecaoNoite")!
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        routineNome.text = nomeRotina?[YourRoutineViewController.index].routineName
        
        //multi seleção
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        routineNome.text = nomeRotina?[YourRoutineViewController.index].routineName
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        routineNome.text = nomeRotina?[YourRoutineViewController.index].routineName
    }
    //reload da tableView
    func reload() {
        self.tableView.reloadData()
    }
    
    //segmentedControl
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            dataFilter = 0
        case 1:
            dataFilter = 1
        case 2:
            dataFilter = 2
        default:
            dataFilter = 0
        }
        reload()
        
    }
}
extension YourRoutineViewController: YourRoutineViewControllerDelegate{
    func didRegister() {
        nomeRotina = try! CoreDataStackRoutine.getRoutine()
        
    }
}

//tableView
extension YourRoutineViewController: UITableViewDelegate{
    
}

extension YourRoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataFilter == 0 {
            if section == 0 {
                return routine.limpezamanha?.count ?? 0
            } else if section == 1 {
                return routine.hidratacaomanha?.count ?? 0
            } else {
                return routine.protecaomanha?.count ?? 0
            }
        }
        else if dataFilter == 1 {
            return routine.protecaotarde?.count ?? 0

        } else {
            if section == 0 {
                return routine.limpezanoite?.count ?? 0
            } else if section == 1 {
                return routine.esfoliacaonoite?.count ?? 0
            } else {
                return routine.protecaonoite?.count ?? 0
            }
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch dataFilter {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did select and the text is \(text)")
            selectedProducts.append(text)
            print("Novo array", selectedProducts)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)
        let text = cell.textLabel!.text
        if let text = text {
            NSLog("did deselect and the text is \(text)")
            if let index = selectedProducts.firstIndex(of: text) {
                selectedProducts.remove(at: index)
                print("Novo array", selectedProducts)
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch dataFilter {
        case 0:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Hidratação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
        case 1:
            switch section {
            case 0:
                return "Proteção"
            default:
                return "Proteção"
                
            }
        case 2:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Esfoliação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
        default:
            switch section {
            case 0:
                return "Limpeza"
            case 1:
                return "Hidratação"
            case 2:
                return "Proteção"
            default:
                return "Limpeza"
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if dataFilter == 0 {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.limpezamanha?[indexPath.row]
                
                return cell
                
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.hidratacaomanha?[indexPath.row]
                return cell
                
            } else if indexPath.section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.protecaomanha?[indexPath.row]
                return cell
                
            }
        } else if dataFilter == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
            cell.textLabel?.text = routine.protecaotarde?[indexPath.row]
            return cell
            
        } else {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.limpezanoite?[indexPath.row]
                return cell
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.esfoliacaonoite?[indexPath.row]
                return cell
                
                
            } else if indexPath.section == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "yourRoutine", for: indexPath) as! YourRoutineTableViewCell
                cell.textLabel?.text = routine.protecaonoite?[indexPath.row]
                return cell
                
            }
            
        }
    
        
        return UITableViewCell()
    }
}


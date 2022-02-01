//
//  NewRoutineViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 02/12/21.
//

import UIKit

class NewRoutineViewController: UIViewController {
    @IBOutlet var tasksTableView: UITableView!
    @IBOutlet var routineName: UITextField!
    @IBOutlet weak var dataStart: UIDatePicker!
    @IBOutlet weak var dataEnd: UIDatePicker!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var today = TodayViewController()
    weak var TodayViewControllerDelegate: TodayViewControllerDelegate?
    var dataFilter = 0
    var defaults = UserDefaults.standard
    var morningTasks: [String] = ["Limpeza", "Hidratação", "Proteção"]
    // Data for home tasks
    var nightTasks: [String] = ["Limpeza", "Esfoliação", "Hidratação"]
    var afternoonTasks: [String] = ["Proteção"]
    
    @IBOutlet var dom: UIButton!
    @IBOutlet var seg: UIButton!
    @IBOutlet var ter: UIButton!
    @IBOutlet var qua: UIButton!
    @IBOutlet var qui: UIButton!
    @IBOutlet var sex: UIButton!
    @IBOutlet var sab: UIButton!
    
    var selectedSection: Int?
    
    var limpezaManha: [String] = []
    var hidratacaoManha: [String] = []
    var protecaoManha: [String] = []
    var protecaoTarde: [String] = []
    var limpezaNoite: [String] = []
    var esfoliacaoNoite: [String] = []
    var protecaoNoite: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
//        routineName.delegate = self
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tap)
        
        defaults.set(limpezaManha, forKey: "limpezaManha")
        defaults.set(hidratacaoManha, forKey: "hidratacaoManha")
        defaults.set(protecaoManha, forKey: "protecaoManha")
        defaults.set(protecaoTarde, forKey: "protecaoTarde")
        defaults.set(limpezaNoite, forKey: "limpezaNoite")
        defaults.set(esfoliacaoNoite, forKey: "esfoliacaoNoite")
        defaults.set(protecaoNoite, forKey: "protecaoNoite")
        
        //picker
        UIDatePicker.appearance().tintColor = UIColor(named: "Rosa")
        //        var week: [UIButton] = [dom, seg, ter, qua, qui, sex, sab]
        
        //textField
        routineName.layer.borderWidth = 1
        routineName.layer.cornerRadius = 6
        routineName.layer.borderColor = UIColor(named: "Rosa")?.cgColor
        
        //tableView
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        
        //botões de repetição
        dom.translatesAutoresizingMaskIntoConstraints = false
        dom.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        ter.translatesAutoresizingMaskIntoConstraints = false
        ter.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        qua.translatesAutoresizingMaskIntoConstraints = false
        qua.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        qui.translatesAutoresizingMaskIntoConstraints = false
        qui.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        sex.translatesAutoresizingMaskIntoConstraints = false
        sex.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
        sab.translatesAutoresizingMaskIntoConstraints = false
        sab.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        limpezaManha = defaults.stringArray(forKey: "limpezaManha") ?? []
        hidratacaoManha = defaults.stringArray(forKey: "hidratacaoManha") ?? []
        protecaoManha = defaults.stringArray(forKey: "protecaoManha") ?? []
        protecaoTarde = defaults.stringArray(forKey: "protecaoTarde") ?? []
        limpezaNoite = defaults.stringArray(forKey: "limpezaNoite") ?? []
        esfoliacaoNoite = defaults.stringArray(forKey: "esfoliacaoNoite") ?? []
        protecaoNoite = defaults.stringArray(forKey: "protecaoNoite") ?? []
        reload()
        
    }
    //ação do botão de repetição
    @objc func click(button: UIButton){
        if !button.isSelected{
            //            botao.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(named: "Rosa")
            button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            
        } else {
            //            botao.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            button.backgroundColor = UIColor(named: "Bg")
            
        }
        button.isSelected = !button.isSelected
        
        
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
    //reload da tableView
    func reload() {
        self.tasksTableView.reloadData()
    }
    
    @objc func dismissKeyboard(){
        routineName.resignFirstResponder()
        view.endEditing(true)
    }
    
    @IBAction func saveFunc(_ sender: Any) {
        
        guard let routineName = self.routineName.text else {
            return
        }
        let dataEnd: Date = self.dataEnd.date
        let dataStart: Date = self.dataStart.date
        let seg: Bool = (self.seg != nil)
        let ter: Bool = (self.ter != nil)
        let qua: Bool = (self.qua != nil)
        let qui: Bool = (self.qui != nil)
        let sex: Bool = (self.sex != nil)
        let sab: Bool = (self.sab != nil)
        let dom: Bool = (self.dom != nil)
        
        //Nome da rotina vazio
        if routineName == "" {
            let ac = UIAlertController(title: "Dados incompletos", message: "O campo 'Nome' não está preenchido", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        }
        //Tarefas vazias
        if limpezaManha == [] || hidratacaoManha == [] || protecaoManha == [] || protecaoTarde == [] || limpezaNoite == [] || esfoliacaoNoite == [] || protecaoNoite == [] {
            let ac = UIAlertController(title: "Dados incompletos", message: "Uma das tarefas não está preenchida", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        }
        //Data de inicio e fim invalidas
        if dataStart < Date() && dataEnd <= dataStart {
            let ac = UIAlertController(title: "Dados inválidos", message: "A data de início e fim da sua rotina estão inválidas", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        }
        //Data de inicio invalida
        if dataStart < Date(){ //nao ta funcionando certo
            let ac = UIAlertController(title: "Dados inválidos", message: "A data de início da sua rotina está inválida", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        } else if dataStart == Date() {
            print ("ok")
        }
        //Data de fim inválida
        if dataEnd <= dataStart{
            let ac = UIAlertController(title: "Dados inválidos", message: "A data do fim da sua rotina está inválida", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        }
        //Campo "repetir" vazio
        if seg == false && ter == false && qua == false && qui == false && sex == false && sab == false && dom == false{
            let ac = UIAlertController(title: "Dados incompletos", message: "O campo 'Repetir' não está preenchido.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            ac.view.tintColor = UIColor(named: "Rosa")
            present(ac, animated: true)
        }
        
        var _ = try? CoreDataStackRoutine.createRoutine(dateStart: dataStart, dateEnd: dataEnd, dom: dom, sab: sab, sex: sex, qui: qui, qua: qua, ter: ter, seg: seg, routineName: routineName) 
       
        self.navigationController?.popViewController(animated: true)
    }
}

//tableView
extension NewRoutineViewController: UITableViewDelegate{
    
}

extension NewRoutineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataFilter == 0 {
            if section == 0 {
                return limpezaManha.count + 1
            } else if section == 1 {
                return hidratacaoManha.count + 1
            } else {
                return protecaoManha.count + 1
            }
            
        } else if dataFilter == 1 {
            return protecaoTarde.count + 1
        } else {
            if section == 0 {
                return limpezaNoite.count + 1
            } else if section == 1 {
                return esfoliacaoNoite.count + 1
            } else {
                return protecaoNoite.count + 1
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "newproductroutine") as! NewProductRoutineViewController
        self.navigationController?.pushViewController(vc, animated: false)
        if dataFilter == 0 {
            defaults.set(dataFilter, forKey: "filtro")
        } else if dataFilter == 1 {
            defaults.set(dataFilter, forKey: "filtro")
        } else {
            defaults.set(dataFilter, forKey: "filtro")
        }
        selectedSection = indexPath.section
        defaults.set(selectedSection, forKey: "section")
        print(defaults.integer(forKey: "section"))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let totalOfRows = tasksTableView.numberOfRows(inSection: indexPath.section)
        if dataFilter == 0 {
            if indexPath.section == 0 {
                if limpezaManha.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = limpezaManha[indexPath.row]
                        return cell
                        
                    }
                }
            } else if indexPath.section == 1 {
                if hidratacaoManha.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = hidratacaoManha[indexPath.row]
                        return cell
                        
                    }
                }
                
            } else if indexPath.section == 2{
                if protecaoManha.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = protecaoManha[indexPath.row]
                        return cell
                        
                    }
                }
                
            }
        } else if dataFilter == 1 {
            if protecaoTarde.count == 0 {
                let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                return cell
            }
            else {
                if indexPath.row == totalOfRows - 1 { //ultima celula
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                } else {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                    cell.titleTask.text = protecaoTarde[indexPath.row]
                    return cell
                    
                }
            }
        } else {
            if indexPath.section == 0 {
                if limpezaNoite.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = limpezaNoite[indexPath.row]
                        return cell
                        
                    }
                }
            } else if indexPath.section == 1 {
                if esfoliacaoNoite.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = esfoliacaoNoite[indexPath.row]
                        return cell
                        
                    }
                }
                
            } else if indexPath.section == 2{
                if protecaoNoite.count == 0 {
                    let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                    return cell
                }
                else {
                    if indexPath.row == totalOfRows - 1 { //ultima celula
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "add", for: indexPath) as! AddProductTableViewCell
                        return cell
                    } else {
                        let cell = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
                        cell.titleTask.text = protecaoNoite[indexPath.row]
                        return cell
                        
                    }
                }
                
            }
            
        }
        
        return UITableViewCell()
    }
}



extension NewRoutineViewController: NewRoutineViewControllerDelegate{
    func didRegister() {
        
    }
}

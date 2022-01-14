//
//  SkinTypeViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class SkinTypeViewController: UIViewController {
    @IBOutlet var routineTableView: UITableView!
    @IBOutlet var tasksSegmentedControl: UISegmentedControl!
    @IBOutlet var skinTypeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var defaults = UserDefaults.standard
    
    var jsonObjects: [Product] = []
    public var data: [String] = []
    public let group = DispatchGroup()
    var previousView = FormViewController()
    
    @IBOutlet weak var skinImage: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var meetLabel: UILabel!
    var colorSkin: String = ""
    
    var currentCounter = UserDefaults.standard.array(forKey: "contador") as? [Int] ?? [0,0,0,0,0] //Pega novo defaults
    var currentColorCounter = UserDefaults.standard.array(forKey: "corContador") as? [String] ?? ["","","","",""] //Pega novo defaults
    
    var dataFilter = 0
    var morningTasks: [String] = ["Limpeza", "Hidratação", "Proteção"]
    var nightTasks: [String] = ["Limpeza", "Esfoliação", "Hidratação"]
    var afternoonTasks: [String] = ["Proteção"]
    var skinType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Contador depois:", currentCounter)
        print("Contador cor depois:", currentColorCounter)
        
        
        let resposta = getAnswers(dicionario: currentCounter)
        print("Resposta:",resposta)
        
        let repetidos: [Int:Int] = resposta[0]
        let desempate: [Int:Int] = resposta[1]
        print("Repetidos:", repetidos)
        print("Desempate:", desempate)

        if repetidos.count <=  desempate.count || desempate.count == 0 { //Sem desempate, mas algo tava no desempate (y:4, x:1)
                    getMax(dicionario: repetidos)
                } else { //Quando houver empate
                    getSkin(dicionarioRepetido: repetidos, dicionarioDesempate: desempate)
                }
        
        //Caso existem chaves que estão se repetindo, ele pega a maior
        setupColor()
        
        let mainString = "Sua pele é \(skinType)"
        progressView.progress = 0.75
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        //atributted string para mudar a cor do tipo de pele
        let range = (mainString as NSString).range(of: skinType)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: colorSkin)!, range: range)
        skinTypeLabel.attributedText = mutableAttributedString
        
        switch skinType {
        case "oleosa":
            setupPage(girl: "girl1", skin: "oleosa", name: "Maria")
            
        case "normal":
            setupPage(girl: "boy2", skin: "normal", name: "Luiz")
            
        case "seca":
            setupPage(girl: "boy3", skin: "seca", name: "Carlos")
            
        case "mista":
            setupPage(girl: "girl4", skin: "mista", name: "Olivia")
            
        default:
            print("erro")
            
        }
        
        //tableView
        self.routineTableView.delegate = self
        self.routineTableView.dataSource = self
        
        
        //        //navigationBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")
        setupData(products: jsonObjects)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = "https://restapi-skinfeel.herokuapp.com/produtos"
        let instance = Request()
        group.enter()
        instance.getData(from: url) { result in
            defer{self.group.leave()}
            switch result {
            case .success(let products):
                for product in products{
                    self.jsonObjects.append(product)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        group.notify(queue: .main){
            print(self.jsonObjects)
            self.setupData(products: self.jsonObjects)
            print(self.data)
            self.defaults.set(self.data, forKey: "completeTable")
        }
    }
    
    //COM EMPATE
    func getAnswers(dicionario: [Int]) -> [[Int:Int]]{ //retorno do dicionario de repetidos, e o dicionario de desempate
        var aux: [Int:Int] = [:] //dicionario auxiliar
        var repetidos: [Int:Int] = [:] //dicionário de números que foram repetidos
        var desempate: [Int:Int] = [:] //dicionário com o número de desempate
        
        for v in dicionario { //passando por todas as chaves do dicionario
            if aux.keys.contains(v) {
                aux[v]! += 1
            } else {
                aux[v] = 1
            }
        }
        for k in aux.keys {
            if aux[k]! > 1 { //Se o dicionário tiver mais que uma chave, é porque ele entra no dicionário repetidos
                repetidos[k] = aux[k]
            } else { //Se o dicionário tiver menos que uma chave, é porque ele entra no dicionário de desempate
                desempate[k] = aux[k]
            }
        }
        let lista: [[Int:Int]] = [repetidos, desempate]
        return lista
    }
    
    //SEM DESEMPATE
    func getMax(dicionario: [Int:Int]) {
            //Pegando o maior valor no vetor da resposta
            let maxValueOfSomeDictionary = dicionario.max {
                a, b in a.value < b.value
            }
            print("Maior chave: \(maxValueOfSomeDictionary!.key):",maxValueOfSomeDictionary!.value) //Pega o maior value de uma key do dicionário

            switch maxValueOfSomeDictionary!.key { //Verifica qual é a key
            case 1:
                skinType = "mista"
            case 2:
                skinType = "normal"
            case 3:
                skinType = "oleosa"
            case 4:
                skinType = "seca"
            default:
                skinType = "erro"
            }
    }
    
    func getSkin(dicionarioRepetido: [Int:Int], dicionarioDesempate: [Int:Int]) {
        //Pegando o maior valor no vetor da resposta
        let maxValueOfSomeDictionary = dicionarioDesempate.max {
            a, b in a.value < b.value
        }
        print("Chave de desempate: \(maxValueOfSomeDictionary!.key)") //Pega o maior value de uma key do dicionário
        let valor1 = dicionarioRepetido.keys.max()!
        let valor2 = dicionarioRepetido.keys.min()!
        switch maxValueOfSomeDictionary!.key { //Verifica qual é a key
        case 1:
            if (valor1 == 2 && valor2 == 3) || (valor1 == 3 && valor2 == 2) {
                skinType = "oleosa"
            } else if (valor1 == 4 && valor2 == 2) || (valor1 == 2 && valor2 == 4) {
                skinType = "seca"
            } else if (valor1 == 3 && valor2 == 4) || (valor1 == 4 && valor2 == 3) {
                skinType = "oleosa"
            }
        case 2:
            if (valor1 == 1 && valor2 == 3) || (valor1 == 3 && valor2 == 1) {
                skinType = "oleosa"
            } else if (valor1 == 4 && valor2 == 1) || (valor1 == 1 && valor2 == 4) {
                skinType = "seca"
            } else if (valor1 == 3 && valor2 == 4) || (valor1 == 4 && valor2 == 3) {
                skinType = "seca"
            }
        case 3:
            if (valor1 == 2 && valor2 == 1) || (valor1 == 1 && valor2 == 2) {
                skinType = "mista"
            } else if (valor1 == 4 && valor2 == 1) || (valor1 == 1 && valor2 == 4) {
                skinType = "mista"
            } else if (valor1 == 2 && valor2 == 4) || (valor1 == 4 && valor2 == 2) {
                skinType = "normal"
            }
        case 4:
            if (valor1 == 2 && valor2 == 1) || (valor1 == 1 && valor2 == 2) {
                skinType = "normal"
            } else if (valor1 == 2 && valor2 == 3) || (valor1 == 3 && valor2 == 2) {
                skinType = "normal"
            } else if (valor1 == 1 && valor2 == 3) || (valor1 == 3 && valor2 == 1) {
                skinType = "mista"
            }
        default:
            skinType = "erro"
        }
    }
                
    func setupPage(girl: String, skin: String, name: String){ //Configurando a página
        defaults.set("\(girl)-profile", forKey: "profileImage")
        skinType = skin
        subtitle.text = "A rotina de \(name) vai te ajudar a começar"
        meetLabel.text = "Conheça \(name)"
        skinImage.image = UIImage(named: girl)
    }
    
    func setupColor(){ //Configurando a cor que ficará no título
        switch skinType {
        case "oleosa":
            colorSkin = "Verde"
        case "normal":
            colorSkin = "Azul"
        case "seca":
            colorSkin = "Rosa"
        case "mista":
            colorSkin = "Roxo"
        default:
            colorSkin = "gelo botao"
        }
    }
    
    
    //Ação do backButton
    @objc func back(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "forms") as! FormViewController
        progressView.progress = 0.6
        vc.currentQuestion = vc.currentQuestion <= vc.questions.count ? 4 : 1
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //segmentedControl
    @IBAction func segmentedControlAction(sender: AnyObject) {
        switch tasksSegmentedControl.selectedSegmentIndex {
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
        self.routineTableView.reloadData()
    }
    
    func setupData(products: [Product]) {
        for jsonObject in jsonObjects {
            data.append(jsonObject.nome)
        }
    }
}


//tableView
extension SkinTypeViewController: UITableViewDelegate {
    
}

extension SkinTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataFilter {
        case 0: return morningTasks.count
        case 1: return afternoonTasks.count
        case 2: return nightTasks.count
        default: return morningTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = routineTableView.dequeueReusableCell(withIdentifier: "rotina", for: indexPath) as! SkinRoutineTableViewCell
        
        var title: String?
        switch dataFilter {
        case 0:
            title = morningTasks[indexPath.row]
        case 1:
            title = afternoonTasks[indexPath.row]
        case 2:
            title = nightTasks[indexPath.row]
        default:
            title = morningTasks[indexPath.row]
            
        }
        cell.textLabel?.text = title
        
        return cell
    }
    
}

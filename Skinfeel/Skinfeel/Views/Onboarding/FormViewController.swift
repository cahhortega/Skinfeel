//
//  FormViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let questions = ["Quantas vezes por dia você sente necessidade de lavar o rosto?",
                     "Como você descreveria sua pele?",
                     "Poros são buraquinhos na pele. Ao se olhar no espelho, você consegue observá-los?",
                     "Você costuma ter espinhas ou cravos?",
                     "Depois de praticar uma atividade física, seu rosto fica como?"]
    
    let answers = [["Em dias úmidos ou no verão sinto mais necessidade",
                    "Só uma vez, geralmente para tirar a maquiagem",
                    "Várias vezes,sinto minha pele com aspecto sujo",
                    "Não sinto necessidade, somente no banho"],
                   
                   ["Em alguns locais parece oleosa e em outros não",
                    "Não possuo oleosidade aparente, estando sempre com aspecto hidratado",
                    "Muita oleosidade por todo o rosto, podendo aparecer espinhas",
                    "Minha pele é opaca e sem brilho, às vezes avermelhada ou recssecada"],
                   
                   ["Posso vê-los mais no queixo, nariz ou testa",
                    "Não muito, são pouco aparentes",
                    "Sim, posso ver no rosto todo",
                    "Não, minha pele é completamente lisa"],
                   
                   ["De vez em quando",
                    "É bem difícil",
                    "Quase sempre",
                    "Nunca"],
                   
                   ["Um pouco oleoso e suado",
                    "Com as bochechas avermelhadas e suado",
                    "Muito oleoso e 'pegajoso'","Avermelhado e ardendo"]]
    
    var currentQuestion = 0 //0 a 4
    var defaults = UserDefaults.standard
    
    var button: UIButton = UIButton() //Botão questão
    
    var formCounter = UserDefaults.standard.array(forKey: "contador") as? [Int] ?? [0,0,0,0,0] //Pega defaults
    var colorCounter = UserDefaults.standard.array(forKey: "corContador") as? [String] ?? ["a","a","a","a","a"] //Pega defaults
    //label
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var lbl: UILabel!
    //button
    @IBOutlet weak var dryButton: UIButton!
    @IBOutlet weak var oilyButton: UIButton!
    @IBOutlet weak var mixedButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(backButton)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")
        
        nextButton.isEnabled = false
        if formCounter[currentQuestion] != 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
        
        if progressView.progress == 0.0{
            progressView.progress = 0.2
            if currentQuestion == 4 {
                progressView.progress = 0.6
            }
        }
        
        newQuestion()
        mixedButton.addTarget(self, action: #selector(clickButton1), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(clickButton2), for: .touchUpInside)
        oilyButton.addTarget(self, action: #selector(clickButton3), for: .touchUpInside)
        dryButton.addTarget(self, action: #selector(clickButton4), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(backButton)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")
        
        nextButton.isEnabled = false
        if formCounter[currentQuestion] != 0 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
        
        newQuestion()
        mixedButton.addTarget(self, action: #selector(clickButton1), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(clickButton2), for: .touchUpInside)
        oilyButton.addTarget(self, action: #selector(clickButton3), for: .touchUpInside)
        dryButton.addTarget(self, action: #selector(clickButton4), for: .touchUpInside)
        
    }
    
    func newQuestion(){
        nextButton.isEnabled = true
        lbl.text = questions[currentQuestion]
        var x = 0
        for i in 1...4 {
            button = view.viewWithTag(i) as! UIButton
            button.titleLabel?.textAlignment = .center
            button.setTitle(answers[currentQuestion][x], for: .normal)
            x += 1
        }
        if colorCounter[currentQuestion] == "Roxo botao" {
            defineColor(cor: "Roxo botao", selected: mixedButton, button1: normalButton, button2: oilyButton, button3: dryButton)
            nextButton.isEnabled = true
        } else if colorCounter[currentQuestion] == "Azul botao" {
            defineColor(cor: "Azul botao", selected: normalButton, button1: mixedButton, button2: oilyButton, button3: dryButton)
            nextButton.isEnabled = true
        } else if colorCounter[currentQuestion] == "Verde botao" {
            defineColor(cor: "Verde botao", selected: oilyButton, button1: normalButton, button2: mixedButton, button3: dryButton)
            nextButton.isEnabled = true
        } else if colorCounter[currentQuestion] == "Rosa botao" {
            defineColor(cor: "Rosa botao", selected: dryButton, button1: normalButton, button2: oilyButton, button3: mixedButton)
            nextButton.isEnabled = true
        } else{
            nextButton.isEnabled = false
            mixedButton.backgroundColor = UIColor(named: "gelo botao")
            normalButton.backgroundColor = UIColor(named: "gelo botao")
            oilyButton.backgroundColor = UIColor(named: "gelo botao")
            dryButton.backgroundColor = UIColor(named: "gelo botao")
            
        }
    }
    
    func defineColor(cor: String, selected: UIButton, button1: UIButton, button2: UIButton, button3: UIButton) {
        if currentQuestion == 0 {
            defaults.setValue(cor, forKey: "answer0")
            colorCounter[0] = defaults.string(forKey: "answer0")!
            print(colorCounter)
            selected.backgroundColor = UIColor(named: defaults.string(forKey: "answer0")!)
            button1.backgroundColor = UIColor(named: "gelo botao")
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
            
        } else if currentQuestion == 1 {
            defaults.setValue(cor, forKey: "answer1")
            colorCounter[1] = defaults.string(forKey: "answer1")!
            print(colorCounter)
            selected.backgroundColor = UIColor(named: defaults.string(forKey: "answer1")!)
            button1.backgroundColor = UIColor(named: "gelo botao")
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
            
        } else if currentQuestion == 2 {
            defaults.setValue(cor, forKey: "answer2")
            colorCounter[2] = defaults.string(forKey: "answer2")!
            print(colorCounter)
            selected.backgroundColor = UIColor(named: defaults.string(forKey: "answer2")!)
            button1.backgroundColor = UIColor(named: "gelo botao")
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
            
        } else if currentQuestion == 3 {
            defaults.setValue(cor, forKey: "answer3")
            colorCounter[3] = defaults.string(forKey: "answer3")!
            print(colorCounter)
            selected.backgroundColor = UIColor(named: defaults.string(forKey: "answer3")!)
            button1.backgroundColor = UIColor(named: "gelo botao")
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
            
        } else {
            defaults.setValue(cor, forKey: "answer4")
            colorCounter[4] = defaults.string(forKey: "answer4")!
            print(colorCounter)
            selected.backgroundColor = UIColor(named: defaults.string(forKey: "answer4")!)
            button1.backgroundColor = UIColor(named: "gelo botao")
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
        }
        
    }
    
    @objc func backButton(){
        if currentQuestion <= 4 && currentQuestion != 0{
            currentQuestion -= 1
            progressView.progress -= 0.1
            return newQuestion()
            
        } else if currentQuestion == 0{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "name") as! NameViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if currentQuestion != questions.count {
            currentQuestion += 1
            if currentQuestion > 4 {
                defaults.setValue(formCounter, forKey: "contador")
                defaults.setValue(colorCounter, forKey: "corContador")
                performSegue(withIdentifier: "choiceView", sender: self)

            } else {
                newQuestion()
                progressView.progress += 0.1
                
            }
        }
    }
    

    
    
    //ação dos botões
    @objc func clickButtons(selected: UIButton,
                            button2: UIButton,
                            button3: UIButton,
                            button4: UIButton, color: String) {
        if !selected.isSelected{
            nextButton.isEnabled = true
            selected.backgroundColor = UIColor(named: color)
            button2.backgroundColor = UIColor(named: "gelo botao")
            button3.backgroundColor = UIColor(named: "gelo botao")
            button4.backgroundColor = UIColor(named: "gelo botao")
            
        }
        else {
            selected.backgroundColor = UIColor(named: "gelo botao")
        }
        
    }
    //declarar a ação de cada um dos botões
    @objc func clickButton1(){
        clickButtons(selected: mixedButton, button2: normalButton, button3: oilyButton, button4: dryButton, color: "Roxo botao")
        formCounter[currentQuestion] = 1
        defineColor(cor: "Roxo botao", selected: mixedButton, button1: normalButton, button2: oilyButton, button3: dryButton)
        print(formCounter)
        
        
    }
    
    @objc func clickButton2(){
        clickButtons(selected: normalButton, button2: mixedButton, button3: oilyButton, button4: dryButton, color: "Azul botao")
        formCounter[currentQuestion] = 2
        defineColor(cor: "Azul botao", selected: normalButton, button1: mixedButton, button2: oilyButton, button3: dryButton)
        print(formCounter)
        
    }
    
    @objc func clickButton3(){
        clickButtons(selected: oilyButton, button2: normalButton, button3: mixedButton, button4: dryButton, color: "Verde botao")
        formCounter[currentQuestion] = 3
        defineColor(cor: "Verde botao", selected: oilyButton, button1: normalButton, button2: mixedButton, button3: dryButton)
        print(formCounter)
        
    }
    
    @objc func clickButton4(){
        clickButtons(selected: dryButton, button2: normalButton, button3: oilyButton, button4: mixedButton, color: "Rosa botao")
        formCounter[currentQuestion] = 4
        defineColor(cor: "Rosa botao", selected: dryButton, button1: normalButton, button2: oilyButton, button3: mixedButton)
        print(formCounter)
        
    }
    
}

//
//  NameViewController.swift
//  Skinfeel
//
//  Created by Gabriele Namie on 10/01/22.
//

import UIKit



class NameViewController: UIViewController, UITextFieldDelegate {
    
    var defaults = UserDefaults.standard
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var name: UITextField!
    
    
    var formCounter: [Int] = [0,0,0,0,0]
    
    var colorCounter: [String] = ["a","a","a","a","a"]
    
    @IBSegueAction func nextButton(_ coder: NSCoder) -> FormViewController? {
        next()
        return FormViewController(coder: coder)
    }
    
    func next() {
        defaults.setValue(name.text, forKey: "name")
        defaults.setValue(formCounter, forKey: "contador") //Cria defaults
        defaults.setValue(colorCounter, forKey: "corContador")//Cria defaults cor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        
        //Fazer o teclado sumir quando tocar fora dele
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        print("Contador inicial:", formCounter)
        print("Contador cor inicial:", colorCounter)
        progressView.progress = 0.1
        navigationController?.setNavigationBarHidden(false, animated: false)
        name.layer.borderWidth = 1
        name.layer.cornerRadius = 6
        name.layer.borderColor = UIColor(named: "Rosa")?.cgColor
        
        // Do any additional setup after loading the view.
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(onboardingBack))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "Rosa")
        
        
    }
    
    @objc func dismissKeyboard(){
        name.resignFirstResponder()
        view.endEditing(true)
    }
    
    @objc func onboardingBack(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "firstView") as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
}



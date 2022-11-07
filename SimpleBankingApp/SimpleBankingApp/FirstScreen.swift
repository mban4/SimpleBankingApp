//
//  ViewController.swift
//  SimpleBankingApp
//
//  Created by ntubic on 31.10.2022..
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()
    var loginName = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemBlue
        title = "Mario Ban"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI(){
        view.addSubview(nextButton)
        view.addSubview(loginName)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Login"
        
        nextButton.addTarget(self, action: #selector(openPopUp), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    @objc func openPopUp(){
        let popUp = PopUp()
        view.addSubview(popUp)
    }
    
    @objc func goToNextScreen(){
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    

}


//
//  PopUp.swift
//  SimpleBankingApp
//
//  Created by ntubic on 02.11.2022..
//

import UIKit

class PopUp: UIView{
    
    let firstScreen = FirstScreen()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "Login"
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let passwordField: UITextField = {
        let password = UITextField(frame: CGRect(x: 10, y: 320,width: 300, height: 30));
        password.placeholder = "Enter password"
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.backgroundColor = .cyan
        password.textColor = .darkGray
        password.textAlignment = .center
        return password
    }()
    
    
    fileprivate let container : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
    fileprivate let login : UIButton = {
        let login = UIButton()
        login.configuration = .filled()
        login.configuration?.baseBackgroundColor = .systemPink
        login.configuration?.title = "Login"
        
        login.translatesAutoresizingMaskIntoConstraints = false
        login.addTarget(FirstScreen(), action: #selector(PopUp.checkPassword), for: .touchUpInside)
        return login
    }()
    
    fileprivate lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, passwordField,login])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundColor = .gray
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ])
        
        container.addSubview(stack)
        NSLayoutConstraint.activate([
//            stack.topAnchor.constraint(equalTo: container.topAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
//            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checkPassword() {
        
        let pass: String = (self.passwordField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!
        let correct = "1234"
        if(correct == pass){
            login.addTarget(FirstScreen(), action: #selector (firstScreen.goToNextScreen), for: .touchUpInside)
        }
//        login.addTarget(firstScreen, action: #selector(firstScreen.goToNextScreen), for: .touchUpInside)
//
//
//
//        validatePassword(pass: passwordField.text ?? "")
    }
    
}

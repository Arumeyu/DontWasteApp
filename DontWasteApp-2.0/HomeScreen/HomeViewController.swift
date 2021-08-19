//
//  homeViewController.swift
//  DontWasteApp-2.0
//
//  Created by user on 18/08/21.
//

import UIKit

class HomeViewController: UIViewController {

    
    //MARK:- Imagens
    
    private let background: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "fundo"))
        imageView.alpha = 0.4
        imageView.contentMode = .scaleAspectFill 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let logo: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "Logo1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let tituloLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Don't"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private let tituloLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Waste"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let tituloLabel3: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 25)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "organize"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private let subtituloLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 40)
        label.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        label.textAlignment = .center
        label.text = "Sua despensa"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    private let subtituloLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 40)
        label.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        label.textAlignment = .center
        label.text = "inteligente"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let primeiroAcessoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PRIMEIRO ACESSO", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.init(displayP3Red: 223/255, green: 213/255, blue: 214/255, alpha: 0.8)
        button.addTarget(self, action: #selector(didTapAcesso),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapLogin),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
       
        //exibindo os elementos na tela
        self.view.addSubview(background)
        self.view.addSubview(logo)
        
        self.view.addSubview(tituloLabel1)
        self.view.addSubview(tituloLabel2)
        self.view.addSubview(tituloLabel3)
        
        self.view.addSubview(subtituloLabel1)
        self.view.addSubview(subtituloLabel2)

        self.view.addSubview(primeiroAcessoButton)
        self.view.addSubview(loginButton)

        setupConstraints()

    }
    
    
    @objc private func didTapAcesso() {
        let loginVC = ViewController()
        self.present(loginVC, animated: true, completion: nil)
    }
    
    
    @objc private func didTapLogin() {
         let loginVC = ViewController()
         self.present(loginVC, animated: true, completion: nil)
     }
    
    
    
    private func setupConstraints(){
        
        background.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 80).isActive = true
        
        tituloLabel1.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
        tituloLabel1.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        
        tituloLabel2.topAnchor.constraint(equalTo: tituloLabel1.bottomAnchor, constant: 2).isActive = true
        tituloLabel2.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        
        tituloLabel3.topAnchor.constraint(equalTo: tituloLabel2.bottomAnchor, constant: 2).isActive = true
        tituloLabel3.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        
        subtituloLabel1.topAnchor.constraint(equalTo: tituloLabel3.bottomAnchor, constant: 20).isActive = true
        subtituloLabel1.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        
        subtituloLabel2.topAnchor.constraint(equalTo: subtituloLabel1.bottomAnchor, constant: 2).isActive = true
        subtituloLabel2.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
        
        primeiroAcessoButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        primeiroAcessoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        primeiroAcessoButton.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        primeiroAcessoButton.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 0.48).isActive = true
    
        loginButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 0.48).isActive = true
        
    
    }
    
}

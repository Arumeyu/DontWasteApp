//
//  homeViewController.swift
//  DontWasteApp-2.0
//
//  Created by user on 18/08/21.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: - OBJETOS
    

    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let space: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let background: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "fundo"))
        imageView.alpha = 0.4
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let logo: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "Logo1"))
        imageView.contentMode = .scaleAspectFit
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
        button.addTarget(self, action: #selector(acaoPrimeiroAcesso),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        button.addTarget(self, action: #selector(acaoLogin),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: - VIEW
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
       
        self.view.addSubview(background)
        self.view.addSubview(container)
        container.addSubview(logo)
        container.addSubview(tituloLabel1)        
        container.addSubview(tituloLabel2)
        container.addSubview(tituloLabel3)
        container.addSubview(space)
        container.addSubview(subtituloLabel1)
        container.addSubview(subtituloLabel2)
        
        self.view.addSubview(primeiroAcessoButton)
        self.view.addSubview(loginButton)

        setupConstraints()

    }
    
    
    
    // MARK: - FUNÇÕES
    
    @objc private func acaoPrimeiroAcesso() {
        let destino = ViewController()
        destino.modalPresentationStyle = .fullScreen
        present(destino, animated: true, completion: nil)
    }
    
    @objc private func acaoLogin() {
        let destino = TelaLoginViewController()
        destino.modalPresentationStyle = .automatic
        present(destino, animated: true, completion: nil)
    }
    
    
    // MARK: - CONSTRAINTS
    
    private func setupConstraints(){
        
        background.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        container.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.60).isActive = true

        logo.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        logo.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.30).isActive = true

        tituloLabel1.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true
        tituloLabel1.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        tituloLabel1.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.10).isActive = true

        tituloLabel2.topAnchor.constraint(equalTo: tituloLabel1.bottomAnchor).isActive = true
        tituloLabel2.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        tituloLabel2.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.10).isActive = true

        tituloLabel3.topAnchor.constraint(equalTo: tituloLabel2.bottomAnchor).isActive = true
        tituloLabel3.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        tituloLabel3.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.10).isActive = true

        space.topAnchor.constraint(equalTo: tituloLabel3.bottomAnchor).isActive = true
        space.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        space.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.06).isActive = true
        
        subtituloLabel1.topAnchor.constraint(equalTo: space.bottomAnchor).isActive = true
        subtituloLabel1.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        subtituloLabel1.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.10).isActive = true

        subtituloLabel2.topAnchor.constraint(equalTo: subtituloLabel1.bottomAnchor).isActive = true
        subtituloLabel2.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        subtituloLabel2.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.13).isActive = true
        
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



class TelaLoginViewController: UIViewController {

        
        let tituloLabel1: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "OpenSans-Bold", size: 35)
            label.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.text = ""
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let tituloLabel2: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "OpenSans-Bold", size: 20)
            label.numberOfLines = 0
            label.textColor = .black
            label.textAlignment = .center
            label.text = ""
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let botaoVoltar: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("VOLTAR", for: .normal)
            button.titleLabel?.font = UIFont(name: "Arial Bold", size: 15)
            button.contentHorizontalAlignment = .center
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
            button.layer.cornerRadius = 25
            button.addTarget(self, action: #selector(acaoVoltar), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tituloLabel1)
        view.addSubview(tituloLabel2)
        view.addSubview(botaoVoltar)
        
        tituloLabel1.text = "LOGIN"
        
        tituloLabel2.text = "Em Desenvolvimento"
        
        
        tituloLabel1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tituloLabel1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        tituloLabel2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tituloLabel2.topAnchor.constraint(equalTo: tituloLabel1.bottomAnchor, constant: 15).isActive = true
        
        botaoVoltar.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        botaoVoltar.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        botaoVoltar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        botaoVoltar.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func acaoVoltar(){
        dismiss(animated: true, completion: nil)
    }
}

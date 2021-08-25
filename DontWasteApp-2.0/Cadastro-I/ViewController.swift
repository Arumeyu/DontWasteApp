//
//  ViewController.swift
//  DontWasteApp-2.0
//
//  Created by user on 17/08/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    //MARK: Fields - Private
    
    let mensagens = Mensagens.init()
    
    let homeButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cadastrohome"), for: .normal)
        button.tintColor = UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(botaoHome), for: .touchUpInside)
        return button
    }()
    
    
    let iconePerfil: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "cadastrousuario"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let userView: UIImageView = {
        let userView = UIImageView()
        userView.image = UIImage (named: "cadastrousuario")
        userView.contentMode = .scaleAspectFit
        userView.clipsToBounds = true
        return userView
    }()
    
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "E-mail"
        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = (CGColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        emailField.backgroundColor = .white
        emailField.leftViewMode = .always
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    
    private let passwordField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "Senha"
        passField.layer.borderWidth = 1
        passField.isSecureTextEntry = true
        passField.layer.borderColor = (CGColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1))
        passField.backgroundColor = .white
        passField.leftViewMode = .always
        passField.translatesAutoresizingMaskIntoConstraints = false
        return passField
    }()
    
    
    private var infoButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cadastro_1_icone_ajuda"), for: .normal)
        button.tintColor = UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonHintTapped), for: .touchUpInside)
        return button
    }()
    
    
    private let labelHint: UILabel = {
        let labelHint = UILabel()
        labelHint.textAlignment = .center
        labelHint.text = "A senha deve conter de 6 à 8 caracteres"
        labelHint.font = .systemFont(ofSize: 15, weight: .semibold)
        labelHint.isHidden = true
        labelHint.translatesAutoresizingMaskIntoConstraints = false
        return labelHint
    }()
    
    
    let proximoButton: UIButton = {
        let button = UIButton(type: .system)
        let corBackground = UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        let corFonte = UIColor.black
        button.setTitle("PRÓXIMO", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(corFonte, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = corBackground
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
        return button
    }()
    
    //MARK: ViewDidLoad - Add Subviews
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(homeButton)
        view.addSubview(iconePerfil)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(infoButton)
        view.addSubview(labelHint)
        view.addSubview(proximoButton)
        
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            proximoButton.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            
            view.addSubview(signOutButton)
            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 52)
            
            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        }
        
        
        setupConstraints()
        
    }
    
    //MARK: Actions
    
    @objc private func botaoHome(){
            dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func buttonHintTapped(){
        
        if infoButton.isTouchInside {
            labelHint.isHidden = false
        } else {
            labelHint.isHidden = true
        }
    }
    
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            proximoButton.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            
            
            signOutButton.removeFromSuperview()
            
        }
        catch {
            print("Ocorreu um erro")
        }
    }
    
    //MARK: Layout Constraints
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
   
    
    //MARK: Verification Fields
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    @objc private func didTapButton(){
        
        let valida = ValidaCadastro()
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        
        if valida.validaEmail(email: email) {
            if valida.validaSenha(senha: password) {
                print("ok")
            } else {
                Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaSenhaErroTitulo, mensagem: mensagens.alertaSenhaErroMensagem)
                return
            }
        } else {
            Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaEmailErroTitulo, mensagem: mensagens.alertaEmailErroMensagem)
            return
        }
        
//        print("Botão Próximo pressionado")
//        guard let email = emailField.text, !email.isEmpty,
//              let password = passwordField.text, !password.isEmpty else {
//            Alerta(controller: self).exibirAlerta(titulo: "Faltam Informações" , mensagem: "")
//            print("Faltando informações")
//            return
//        }
        
        
        // Get Auth Instances
        // attempt sign in
        // if failure, present alert to create account
        // if user continues, create account
        
        // check sign in on app launch
        // allow user to sign out with button
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
                
            }
            
            guard error == nil else {
                //show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("Você se cadastrou")
            
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.proximoButton.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        })
        
    }
    
    //MARK: Create Account Function Authentication
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController (title: "Criar uma conta",
                                       message: "Você gostaria de criar uma conta",
                                       preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continuar",
                                      style: .default,
                                      handler: {_ in
                                        
                                        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                                            
                                            guard let strongSelf = self else {
                                                return
                                            }
                                            
                                            guard error == nil else {
                                                //show account creation
                                                Alerta.init(controller: self!).exibirAlerta(titulo: self!.mensagens.alertaErroCadastroTitulo, mensagem: self!.mensagens.alertaErroCadastroMensagem)
                                                print("Falha na criação da conta")
                                                return
                                            }
                                            
                                            let destino = Cadastro2ViewController()
                                            destino.modalPresentationStyle = .fullScreen
                                            self?.present(destino, animated: true, completion: nil)
                                            
                                        })
                                        
                                      }))
        alert.addAction(UIAlertAction(title: "Cancelar",
                                      style: .cancel,
                                      handler: {_ in
                                      }))
        
        present(alert, animated: true)
    }
    
    
    
    // MARK: - CONSTRAINTS
    
    private func setupConstraints(){
        
        // BOTÃO HOME
        
        let margem = self.view.layoutMarginsGuide
        
        homeButton.topAnchor.constraint(equalTo: margem.topAnchor, constant: 10).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: margem.leadingAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        iconePerfil.centerXAnchor.constraint(equalTo: margem.centerXAnchor).isActive = true
        iconePerfil.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 35).isActive = true
        iconePerfil.widthAnchor.constraint(equalToConstant: 65).isActive = true
        iconePerfil.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        emailField.topAnchor.constraint(equalTo: iconePerfil.bottomAnchor, constant: 35).isActive = true
        emailField.leadingAnchor.constraint(equalTo: margem.leadingAnchor).isActive = true
        emailField.trailingAnchor.constraint(equalTo: margem.trailingAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: margem.leadingAnchor).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: margem.trailingAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        infoButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: margem.trailingAnchor).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        labelHint.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 5).isActive = true
        labelHint.trailingAnchor.constraint(equalTo: margem.trailingAnchor).isActive = true
        labelHint.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        proximoButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        proximoButton.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        proximoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        proximoButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
}






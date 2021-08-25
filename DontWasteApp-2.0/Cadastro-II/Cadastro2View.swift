//
//  CadastroView.swift
//  DontWastAppPaThi
//
//  Created by user on 19/08/21.
//

import UIKit

class Cadastro2View: UIView {

    // MARK: - CRIA SCROLLVIEW
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.isUserInteractionEnabled = true
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - OBJETOS
    let homeContainer: UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var homeButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cadastrohome"), for: .normal)
        button.tintColor = UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let iconePerfilContainer: UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let iconePerfil: UIImageView = {
        let imageView = UIImageView.init(image: #imageLiteral(resourceName: "cadastrousuario"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // NOME ..................................................
    let nomeContainer: UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nomeBorda: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.init(srgbRed: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Nome: "
        label.font = UIFont(name: "Arial Bold", size: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var nomeTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Seu nome completo"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // QUANTIDADE ..................................................
    let qntContainer: UIView =  {
        let view = UIView()
        return view
    }()
    let qntBorda: UIView = {
        let uiView = UIView()
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = CGColor.init(srgbRed: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    var qntTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Selecione"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let qntLabel: UILabel = {
       let label = UILabel()
        label.text = "Quantidade de Pessoas que residem na casa: "
        label.font = UIFont(name: "Arial Bold", size: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // DATA ..................................................
    let dataContainer: UIView =  {
        let view = UIView()
        return view
    }()
    let dataBorda: UIView = {
        let uiView = UIView()
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = CGColor.init(srgbRed: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    var dataTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Selecione"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let dataLabel: UILabel = {
       let label = UILabel()
        label.text = "Qual a data da sua última compra?"
        label.font = UIFont(name: "Arial Bold", size: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // FREQUÊNCIA ..................................................
    let frequenciaContainer: UIView = {
        let view = UIView()
        return view
    }()
    let frequenciaBorda: UIView = {
        let uiView = UIView()
        uiView.layer.borderWidth = 1
        uiView.layer.borderColor = CGColor.init(srgbRed: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    var frequenciaTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Selecione"
        textField.font = UIFont(name: "Arial", size: 17)
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let frequenciaLabel: UILabel = {
       let label = UILabel()
        label.text = "Com que frequência faz compras? "
        label.font = UIFont(name: "Arial Bold", size: 17)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // ESPAÇAMENTO ...........................
    let spaceView: UIView = {
        let view = UIView()
        return view
    }()
    // BOTÃO  ..................................................
    let botaoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var botaoSalvar: UIButton = {
        let button = UIButton(type: .system)
        let corBackground = UIColor.init(displayP3Red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
        let corFonte = UIColor.black
        button.setTitle("SALVAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(corFonte, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = corBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var botaoVoltar: UIButton = {
        let button = UIButton(type: .system)
        let corBackground = UIColor.init(displayP3Red: 223/255, green: 213/255, blue: 214/255, alpha: 0.8)
        let corFonte = UIColor.black
        button.setTitle("VOLTAR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        button.setTitleColor(corFonte, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = corBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - SCROLLVIEW
    func configuraScrollView() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        ConfiguraConteudoScrollView()
    }
    
    // MARK: - SUBVIEW
    func ConfiguraConteudoScrollView() {
        
        stackView.addArrangedSubview(homeContainer)
        homeContainer.addSubview(homeButton)
        
        stackView.addArrangedSubview(iconePerfilContainer)
        homeContainer.addSubview(iconePerfil)
        
        stackView.addArrangedSubview(nomeContainer)
        nomeContainer.addSubview(nomeBorda)
        nomeContainer.addSubview(nomeLabel)
        nomeContainer.addSubview(nomeTextField)
        
        stackView.addArrangedSubview(qntContainer)
        qntContainer.addSubview(qntBorda)
        qntContainer.addSubview(qntLabel)
        qntContainer.addSubview(qntTextField)
        
        stackView.addArrangedSubview(dataContainer)
        dataContainer.addSubview(dataBorda)
        dataContainer.addSubview(dataLabel)
        dataContainer.addSubview(dataTextField)
        
        stackView.addArrangedSubview(frequenciaContainer)
        frequenciaContainer.addSubview(frequenciaBorda)
        frequenciaContainer.addSubview(frequenciaLabel)
        frequenciaContainer.addSubview(frequenciaTextField)
        
        stackView.addArrangedSubview(spaceView)
        
        self.addSubview(botaoContainer)
        botaoContainer.addSubview(botaoSalvar)
        botaoContainer.addSubview(botaoVoltar)
        
        configuraConstraints()
    }
    // MARK: - CONSTRAINTS
    func configuraConstraints() {
        NSLayoutConstraint.activate([
            // BOTÃO HOME
            homeContainer.topAnchor.constraint(equalTo: stackView.topAnchor),
            homeContainer.bottomAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 10),
            
            homeButton.topAnchor.constraint(equalTo: homeContainer.topAnchor, constant: 10),
            homeButton.leadingAnchor.constraint(equalTo: homeContainer.leadingAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 40),
            homeButton.heightAnchor.constraint(equalToConstant: 38),
            
            // ICONE PERFIL
            iconePerfilContainer.topAnchor.constraint(equalTo: homeContainer.bottomAnchor),
            iconePerfilContainer.bottomAnchor.constraint(equalTo: iconePerfil.bottomAnchor, constant: 10),
            
            iconePerfil.centerXAnchor.constraint(equalTo: iconePerfilContainer.centerXAnchor),
            iconePerfil.topAnchor.constraint(equalTo: homeContainer.bottomAnchor, constant: 35),
            iconePerfil.widthAnchor.constraint(equalToConstant: 65),
            iconePerfil.heightAnchor.constraint(equalToConstant: 70),
            
            // NOME
            nomeContainer.topAnchor.constraint(equalTo: iconePerfilContainer.bottomAnchor),
            nomeContainer.bottomAnchor.constraint(equalTo: nomeTextField.bottomAnchor, constant: 10),
            
            nomeBorda.topAnchor.constraint(equalTo: nomeContainer.topAnchor, constant: 50),
            nomeBorda.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            nomeBorda.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            nomeBorda.bottomAnchor.constraint(equalTo: nomeContainer.bottomAnchor),

            nomeLabel.topAnchor.constraint(equalTo: nomeBorda.topAnchor, constant: 15),
            nomeLabel.leadingAnchor.constraint(equalTo: nomeBorda.leadingAnchor, constant: 15),
            nomeLabel.trailingAnchor.constraint(equalTo: nomeBorda.trailingAnchor, constant: -15),

            nomeTextField.topAnchor.constraint(equalTo: nomeLabel.bottomAnchor, constant: 5),
            nomeTextField.leadingAnchor.constraint(equalTo: nomeBorda.leadingAnchor, constant: 15),
            nomeTextField.trailingAnchor.constraint(equalTo: nomeBorda.trailingAnchor, constant: -15),
            nomeTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // QUANTIDADE
            qntContainer.topAnchor.constraint(equalTo: nomeContainer.bottomAnchor),
            qntContainer.bottomAnchor.constraint(equalTo: qntTextField.bottomAnchor, constant: 10),

            qntBorda.topAnchor.constraint(equalTo: qntContainer.topAnchor, constant: 20),
            qntBorda.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            qntBorda.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            qntBorda.bottomAnchor.constraint(equalTo: qntContainer.bottomAnchor),

            qntLabel.topAnchor.constraint(equalTo: qntBorda.topAnchor, constant: 15),
            qntLabel.leadingAnchor.constraint(equalTo: qntBorda.leadingAnchor, constant: 15),
            qntLabel.trailingAnchor.constraint(equalTo: qntBorda.trailingAnchor, constant: -15),

            qntTextField.topAnchor.constraint(equalTo: qntLabel.bottomAnchor, constant: 5),
            qntTextField.leadingAnchor.constraint(equalTo: qntBorda.leadingAnchor, constant: 15),
            qntTextField.trailingAnchor.constraint(equalTo: qntBorda.trailingAnchor, constant: -15),
            qntTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // DATA
            dataContainer.topAnchor.constraint(equalTo: qntContainer.bottomAnchor),
            dataContainer.bottomAnchor.constraint(equalTo: dataTextField.bottomAnchor, constant: 10),

            dataBorda.topAnchor.constraint(equalTo: dataContainer.topAnchor, constant: 20),
            dataBorda.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            dataBorda.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            dataBorda.bottomAnchor.constraint(equalTo: dataContainer.bottomAnchor),

            dataLabel.topAnchor.constraint(equalTo: dataBorda.topAnchor, constant: 15),
            dataLabel.leadingAnchor.constraint(equalTo: dataBorda.leadingAnchor, constant: 15),
            dataLabel.trailingAnchor.constraint(equalTo: dataBorda.trailingAnchor, constant: -15),

            dataTextField.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 5),
            dataTextField.leadingAnchor.constraint(equalTo: dataBorda.leadingAnchor, constant: 15),
            dataTextField.trailingAnchor.constraint(equalTo: dataBorda.trailingAnchor, constant: -15),
            dataTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // FREQUÊNCIA
            frequenciaContainer.topAnchor.constraint(equalTo: dataContainer.bottomAnchor),
            frequenciaContainer.bottomAnchor.constraint(equalTo: frequenciaTextField.bottomAnchor, constant: 10),

            frequenciaBorda.topAnchor.constraint(equalTo: frequenciaContainer.topAnchor, constant: 20),
            frequenciaBorda.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            frequenciaBorda.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            frequenciaBorda.bottomAnchor.constraint(equalTo: frequenciaContainer.bottomAnchor),
            
            frequenciaLabel.topAnchor.constraint(equalTo: frequenciaBorda.topAnchor, constant: 15),
            frequenciaLabel.leadingAnchor.constraint(equalTo: frequenciaBorda.leadingAnchor, constant: 15),
            frequenciaLabel.trailingAnchor.constraint(equalTo: frequenciaBorda.trailingAnchor, constant: -15),

            frequenciaTextField.topAnchor.constraint(equalTo: frequenciaLabel.bottomAnchor, constant: 5),
            frequenciaTextField.leadingAnchor.constraint(equalTo: frequenciaBorda.leadingAnchor, constant: 15),
            frequenciaTextField.trailingAnchor.constraint(equalTo: frequenciaBorda.trailingAnchor, constant: -15),
            frequenciaTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // ESPAÇO
            spaceView.topAnchor.constraint(equalTo: frequenciaContainer.bottomAnchor),
            spaceView.heightAnchor.constraint(equalToConstant: 80),
            
            // BOTÕES
            botaoContainer.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            botaoContainer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            botaoContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            botaoContainer.heightAnchor.constraint(equalToConstant: 80),

            botaoSalvar.topAnchor.constraint(equalTo: botaoContainer.bottomAnchor, constant: -40),
            botaoSalvar.trailingAnchor.constraint(equalTo: botaoContainer.trailingAnchor),
            botaoSalvar.heightAnchor.constraint(equalToConstant: 40),
            botaoSalvar.widthAnchor.constraint(equalToConstant: 100),
            
            botaoVoltar.topAnchor.constraint(equalTo: botaoContainer.bottomAnchor, constant: -40),
            botaoVoltar.leadingAnchor.constraint(equalTo: botaoContainer.leadingAnchor),
            botaoVoltar.heightAnchor.constraint(equalToConstant: 40),
            botaoVoltar.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

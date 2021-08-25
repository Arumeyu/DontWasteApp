//
//  ViewController.swift
//  UIKit Elements
//
//  Created by Thiago de Angele on 14/08/21.
//

import UIKit

class Cadastro2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let cv = Cadastro2View()
    
    var nome = ""
    
    //QUANTIDADE PICKER VIEW
    let qntPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    var qntDePessoas = ""
    let qntDePessoasOpcoes = ["1", "2", "3 ou Mais"]

    // DATA PICKER VIEW
    let datePickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        let local = Locale(identifier: "pt-br")
        datePicker.locale = local
        datePicker.addTarget(self, action: #selector(dataSelecionada(_:)), for: .valueChanged)
        
        // Configurando para exibir apenas o último ano
        let dataAtual: Date = Date()
        var calendario: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendario.timeZone = TimeZone(identifier: "UTC")!
        
        var componentes: DateComponents = DateComponents()
        componentes.calendar = calendario
        componentes.year = 0
        let maxData: Date = calendario.date(byAdding: componentes, to: dataAtual)!
        componentes.year = -1
        let minData: Date = calendario.date(byAdding: componentes, to: dataAtual)!
        datePicker.minimumDate = minData
        datePicker.maximumDate = maxData
        
        return datePicker
    }()
    var dataUltimaCompra = ""
    
    // FREQUÊNCIA PICKER VIEW
    let frequenciaPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    var frequenciaCompras = ""
    let frequenciaComprasOpcoes = ["Pontual", "Semanal", "Quinzenal", "Mensal"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = UIView()
        
        view = cv
        
        qntPickerView.delegate = self
        qntPickerView.dataSource = self
        
        frequenciaPickerView.delegate = self
        frequenciaPickerView.dataSource = self
        
        cv.qntTextField.inputView = qntPickerView
        cv.frequenciaTextField.inputView = frequenciaPickerView
        cv.dataTextField.inputView = datePickerView
        
        
        cv.configuraScrollView()
        
        cv.homeButton.addTarget(self, action: #selector(homeButton), for: .touchUpInside)
        cv.botaoSalvar.addTarget(self, action: #selector(enviarCadastro), for: .touchUpInside)
        cv.botaoVoltar.addTarget(self, action: #selector(botaoVoltar), for: .touchUpInside)
    }
    
    // MARK: - PICKERVIEW DATA SOURCE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == qntPickerView {
            return qntDePessoasOpcoes.count
        } else if pickerView == frequenciaPickerView {
            return frequenciaComprasOpcoes.count
        } else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == qntPickerView {
            let row = qntDePessoasOpcoes[row]
            return row
        } else if pickerView == frequenciaPickerView {
            let row = frequenciaComprasOpcoes[row]
            return row
        } else {
            return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == qntPickerView {
            cv.qntTextField.text = qntDePessoasOpcoes[row]
            self.qntDePessoas = qntDePessoasOpcoes[row]
            desabilitaTecladoClicandoNoBackground()
        } else if pickerView == frequenciaPickerView {
            cv.frequenciaTextField.text = frequenciaComprasOpcoes[row]
            self.frequenciaCompras = frequenciaComprasOpcoes[row]
            desabilitaTecladoClicandoNoBackground()
        }
    }
    
    // MARK: - FUNÇÕES
    
    // DATAPICKER
    @objc func dataSelecionada(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let selectedDate: String = dateFormatter.string(from: sender.date)
        cv.dataTextField.text = selectedDate
        dataUltimaCompra = selectedDate
        desabilitaTecladoClicandoNoBackground()
    }
    

    @objc func homeButton(sender: UIButton!) {
        let page = HomeViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
    
    
    @objc func botaoVoltar(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // BOTÃO SALVAR CADASTRO
    @objc func enviarCadastro(){
        
        let valida = ValidaCadastro()
        let mensagens = Mensagens.init()
        
        self.nome = cv.nomeTextField.text ?? "" //Atualiza variável "Nome"

        // Validações
        if valida.validaNome(nome: nome) { // Valida o campo 'Nome'
            if valida.validaCampoNaoPreenchido(campo: qntDePessoas) { // Valida Quantidade de Pessoas
                if valida.validaCampoNaoPreenchido(campo: dataUltimaCompra) { // Valida Data da Compra
                    if valida.validaCampoNaoPreenchido(campo: frequenciaCompras) {
                        
                        let controllerDestino = CadastroFinalizadoViewController()
                        
                        controllerDestino.nomeCompleto = nome
                        controllerDestino.frequenciaCompras = frequenciaCompras
                        controllerDestino.quantidadeDePessoas = qntDePessoas
                        controllerDestino.dataCompra = dataUltimaCompra
                        
                        let navigationViewController = UINavigationController(rootViewController: controllerDestino)

                        controllerDestino.title = "CADASTRO FINALIZADO"
                        navigationViewController.modalPresentationStyle = .automatic

                        present(navigationViewController, animated: true, completion: nil)
                        
                        
                    } else {
                        Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaFrequenciaTitulo, mensagem: mensagens.alertaFrequenciaMensagem)
                    }
                } else {
                    Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaDataTitulo, mensagem: mensagens.alertaDataMensagem)
                }
            } else {
                Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaQuantidadeTitulo, mensagem: mensagens.alertaQuantidadeMensagem)
            }
        } else {
            Alerta.init(controller: self).exibirAlerta(titulo: mensagens.alertaNomeTitulo, mensagem: mensagens.alertaNomeMensagem)
        }
    }
    
    // FUNÇÃO DESABILITA DECLADO
    func desabilitaTecladoClicandoNoBackground(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
}



class CadastroFinalizadoViewController: UIViewController {
    

        var nomeCompleto = ""
        var quantidadeDePessoas = ""
        var frequenciaCompras = ""
        var dataCompra = ""
        
        let tituloLabel1: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "OpenSans-Bold", size: 25)
            label.textColor = UIColor.init(red: 94/255, green: 186/255, blue: 168/255, alpha: 1)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.text = ""
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let tituloLabel2: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "OpenSans-Bold", size: 15)
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
            button.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
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
        
        tituloLabel1.text = "CADASTRO FINALIZADO\nCOM SUCESSO!"
        
        tituloLabel2.text = "Nome:\n\(nomeCompleto)\n\nQuantos Moram com você:\n\(quantidadeDePessoas)\n\nFrequência de Compras:\n\(frequenciaCompras)\n\nData da Última Compra:\n\(dataCompra)"
        
        
        tituloLabel1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tituloLabel1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        
        tituloLabel2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tituloLabel2.topAnchor.constraint(equalTo: tituloLabel1.bottomAnchor, constant: 15).isActive = true
        
        botaoVoltar.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        botaoVoltar.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        botaoVoltar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        botaoVoltar.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func acaoVoltar(){
        let paginaDestino = HomeViewController()
        paginaDestino.modalPresentationStyle = .fullScreen
        present(paginaDestino, animated: true, completion: nil)
    }
}

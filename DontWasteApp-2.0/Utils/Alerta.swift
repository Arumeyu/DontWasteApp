//
//  Alerta.swift
//  DontWastAppPaThi
//
//  Created by Thiago de Angele on 16/08/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    func exibirAlerta(titulo: String, mensagem: String){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "fechar", style: .cancel, handler: nil)
        
        alerta.addAction(cancelar)
        
        controller.present(alerta, animated: true, completion: nil)
    }
    

}

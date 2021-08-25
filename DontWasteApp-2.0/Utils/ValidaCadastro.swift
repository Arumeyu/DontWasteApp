//
//  ValidaCadastro.swift
//  DontWastAppPaThi
//
//  Created by Thiago de Angele on 17/08/21.
//

import Foundation

struct ValidaCadastro {
    
    func validaNome(nome: String) -> Bool {
        if nome.count > 200 {
            return false
        } else if nome == "" {
            return false
        } else {
            return true
        }
    }
    
    
    func validaCampoNaoPreenchido(campo: String) -> Bool{
        if campo == "" {
            return false
        } else {
            return true
        }
    }
    
    
    func validaEmail(email: String) -> Bool {
        if email == "" {
            return false
        } else {
            return true
        }
    }
    
    
    func validaSenha(senha: String) -> Bool {
        if senha.count < 6 {
            return false
        } else if senha.count > 8 {
            return false
        } else if (Int(senha) == nil) {
            return false
        } else {
            return true
        }
    }
 
    
}

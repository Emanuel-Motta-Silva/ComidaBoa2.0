//
//  Menu.swift
//  br.com.tableview.toodoo
//
//  Created by user209844 on 12/29/21.
//

import Foundation
import UIKit

//Clase do Menu
class Menu {
    
    //Atributos que o menu possui
    let nome: String
    let descricao: String
    let opcoes: [String]
    let preco : Float
    
    
    //Inicializador da classe
    init(nome: String, descricao: String, opcoes: [String] = [], preco:Float){
        self.nome = nome
        self.descricao = descricao
        self.opcoes = opcoes
        self.preco = preco
    }
}

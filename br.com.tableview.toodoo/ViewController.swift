//
//  ViewController.swift
//  br.com.tableview.toodoo
//
//  Created by user209844 on 12/28/21.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //Array de menus
    var menus: [Menu] = []
    
    //Criando table View
    private let mainTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adicionando elemento ao array
        menus.append(Menu(nome: "Carne Assada", descricao: "Carne bovina em tres opções.", opcoes: ["Bem Passada", "Ao Ponto", "Mal Passada"], preco: 17.90))
        menus.append(Menu(nome: "Frango Caipira", descricao: "Frango bem aromatico e delicioso.", opcoes: ["Frango Assado","Frango Frito"], preco: 20.00))
        menus.append(Menu(nome: "Arroz", descricao: "Arroz caseiro feito na hora.", opcoes: ["Integral", "Branco"],preco: 15.00))
        menus.append(Menu(nome: "Feijão", descricao: "Feijão delicioso e suculento.", opcoes: ["Tutu", "Feijoada", "Carioca"], preco: 8.00))
        menus.append(Menu(nome: "Salada", descricao: "Salada fresca e totalmente organica.", opcoes: ["Rucula", "Alface", "Tomate", "Batata"], preco: 11.50))
        menus.append(Menu(nome: "Rocambole", descricao: "Delicioso e quentinho para voce.", opcoes: ["Presunto e queijo", "Carne",], preco: 27.90))
        menus.append(Menu(nome: "Batata Frita", descricao: "Crocante e salpicada com sal.", opcoes: ["Com Bacon", "Com Cheddar",], preco: 25.00))
        
        setupLayout()
    }
    
    //Criando Layout daTable View
    private func setupLayout(){
        self.view.addSubview(self.mainTableView)
        self.mainTableView.edgesToSuperview()
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
    }
    
    //Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier, for: indexPath) as! MenuTableViewCell
        cell.setupContent(menu: menus[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

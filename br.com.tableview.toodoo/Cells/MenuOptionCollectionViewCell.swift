//
//  MenuOptionCollectionViewCell.swift
//  br.com.tableview.toodoo
//
//  Created by user212276 on 12/30/21.
//

import UIKit
import TinyConstraints

class MenuOptionCollectionViewCell: UICollectionViewCell {
    
    //Criando Identificados
    public static let reuseIdentifier = "menuOptionCell"
    
    //Variavel que ira conter as opçoes
    private var menuOption: String = ""
    
    //Botao da Collection view
    private let buttonOption: UIButton = {
        var buttonOption = UIButton()
        buttonOption.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1.0)
        buttonOption.size(.init(width: 200, height: 40))
        buttonOption.layer.cornerRadius = 8
        buttonOption.addTarget(self, action:  #selector(buttonAction), for: .touchUpInside)
        
        return buttonOption
    }()
    
    //Iniciando a collection view
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupMenuOption (menuOption: String) {
        self.buttonOption.setTitle(menuOption, for: .normal)
        
    }
    
    //Criando um layout
    private func setupLayout(){
        self.contentView.addSubview(buttonOption)
        
        //Posicionando botao
        self.buttonOption.topToSuperview(offset: 0)
        self.buttonOption.leadingToSuperview(offset: 0)
    }
    
    //Função do botao
    @objc func buttonAction(sender: UIButton!) {
        print(sender.currentTitle!)
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            
        }
        
    }
    
}

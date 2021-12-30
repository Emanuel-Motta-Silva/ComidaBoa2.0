//
//  MenuTableViewCell.swift
//  br.com.tableview.toodoo
//
//  Created by user209844 on 12/29/21.
//

import UIKit
import TinyConstraints

class MenuTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {


    //Criando Identificadores
    public static let reuseIdentifier = "menuCell"
    
    private var menu: Menu?
    
    //Criando label com nome
    private let labelName: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: label.font.familyName, size: 30)
        return label
    }()
    
    //Criando textField com descriçao
    private let textoDescricao : UITextField = {
        var texto = UITextField()
        texto.textColor = .gray
        return texto
    }()
    
    private let imageCarne : UIImageView = {
        var carne = UIImageView()
        return carne
    }()
    
    //Criando label preço
    private let labelPrice : UILabel = {
        var price = UILabel()
        price.textColor = .black
        return price
    }()
    
    //Criando Collection View
    private let opcoesCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.itemSize = CGSize(width: 200, height: 50)
        layout.collectionView?.backgroundColor = .white
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuOptionCollectionViewCell.self, forCellWithReuseIdentifier: MenuOptionCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    //Iniciando a table View
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupContent(menu: Menu){
        self.menu = menu
        self.labelName.text = menu.nome
        self.textoDescricao.text = menu.descricao
        self.labelPrice.text = "R$ " + String(format: "%0.2f", menu.preco)
        
    }
    
    //Criando Layout da table view
    private func setupLayout(){
        self.contentView.addSubview(self.labelName)
        self.contentView.addSubview(self.textoDescricao)
        self.contentView.addSubview(self.labelPrice)
        self.contentView.addSubview(self.opcoesCollection)
        
        //Posicionando label name
        self.labelName.topToSuperview(offset: 20)
        self.labelName.leadingToSuperview(offset: 20)
        
        //Posicionando texto descriçao
        self.textoDescricao.topToBottom(of: labelName, offset: 15)
        self.textoDescricao.leadingToSuperview(offset: 20)
        
        //Posicionando label preço
        self.labelPrice.topToBottom(of: textoDescricao, offset: 10)
        self.labelPrice.leadingToSuperview(offset: 20)
        
        //Posicionar a collectionview
        self.opcoesCollection.topToBottom(of: labelPrice, offset: 16)
        self.opcoesCollection.leadingToSuperview()
        self.opcoesCollection.trailingToSuperview()
        self.opcoesCollection.bottomToSuperview()
        
        self.opcoesCollection.dataSource = self
    }
    
    //Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu?.opcoes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuOptionCollectionViewCell.reuseIdentifier, for: indexPath) as! MenuOptionCollectionViewCell
        cell.setupMenuOption(menuOption: self.menu?.opcoes[indexPath.row] ?? "")
        return cell
    }
    
}

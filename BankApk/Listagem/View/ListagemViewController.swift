//
//  ListagemViewController.swift
//  BankApk
//
//  Created by Gabriel Aderaldo on 01/05/21.
//

import UIKit

class ListagemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, ServiceDelegate {
    func sucess(type: ResponseType) {
        contact = ContaViewModel.getViews()
        tableView.reloadData()
    }
    
    func failure(type: ResponseType, error: String) {
        print("Falha")
    }
    
    
    var authContas: AuthService!
    var contact:[ContaView] = []
    
     
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ListagemTableViewCell
        cell.bind(nome: contact[indexPath.row].nome, data: contact[indexPath.row].data, valor: contact[indexPath.row].valor)
        return cell
    }

    let tableView:UITableView = {
        let tableView = UITableView()
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none
        self.authContas = AuthService(delegate: self)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tableView.estimatedRowHeight = 500
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: ListagemTableViewCell.self)
        
        self.setupLayout()
        self.setupHeader()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.authContas.listarConta()
    
    }


    func setupHeader(){
        let usuario = SessionControll.shared.usuario ?? UsuarioView.init(id: "0", name: "Gabriel", email: "gaderaldo", conta: "001", saldo: "0", token: "001122")
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        header.bind(usuario: usuario)
        tableView.tableHeaderView = header
        
        
        
    }
    
    
}




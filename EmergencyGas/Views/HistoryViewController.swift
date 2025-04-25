//
//  HistoryViewController.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 24/04/25.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    lazy var tabela: UITableView = {
        let tabela = UITableView()
        tabela.register(AlertaCell.self, forCellReuseIdentifier: "celula")

        
        tabela.backgroundColor = .clear
        view.backgroundColor = .background
        
        tabela.separatorColor = .gray
        tabela.separatorInset = .zero
        tabela.dataSource = self
        tabela.delegate = self
        //tabela.register(UITableViewCell.self, forCellReuseIdentifier: "celula")
        tabela.frame = view.bounds
        return tabela
    }()
     
    private var alertas: [Alerta] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarTabela), name: NSNotification.Name("NovoAlerta"), object: nil)
        alertas = AlertaManager.shared.historico.reversed()
        titleBar()
     
        view.addSubview(tabela)
    }
  
    
    
    private func titleBar () {
        let titleLabel = UILabel()
        titleLabel.text = "Histórico de Alertas"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold) // aqui você muda o tamanho
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
    }
    
    @objc func atualizarTabela() {
        alertas = Array(AlertaManager.shared.historico.reversed())
        tabela.reloadData()
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alerta = alertas[indexPath.row]
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! AlertaCell
            cell.configurarCom(alerta: alerta)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
//        
//        
//        cell.textLabel?.textColor = .white
//        cell.backgroundColor = .clear
//         cell.selectionStyle = .none
//        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.text = "\(alerta.mensagem)\nNível: \(alerta.nivel)\n\(formatter.string(from: alerta.data))"
        return cell
    }
}



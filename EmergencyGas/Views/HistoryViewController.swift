//
//  HistoryViewController.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 24/04/25.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tabela = UITableView()
    private var alertas: [Alerta] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Histórico de Alertas"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        
        tabela.backgroundColor = .clear
        view.backgroundColor = .background
        alertas = AlertaManager.shared.historico.reversed()
        tabela.separatorColor = .gray
        tabela.separatorInset = .zero
        tabela.dataSource = self
        tabela.delegate = self
        tabela.register(UITableViewCell.self, forCellReuseIdentifier: "celula")
        tabela.frame = view.bounds
        view.addSubview(tabela)
    }
    
   
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alerta = alertas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(alerta.mensagem)\nNível: \(alerta.nivel)\n\(formatter.string(from: alerta.data))"
        return cell
    }
}

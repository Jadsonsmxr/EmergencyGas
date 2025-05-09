//
//  HistoryManager.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 24/04/25.
//

import Foundation

struct Alerta: Codable {
    let id: UUID
    
    let data: Date
    let mensagem: String
    let cor: String
}


class AlertaManager {
    static let shared = AlertaManager()
    
    private let chave = "historico_alertas"
    private(set) var historico: [Alerta] = []
    
    private init() {
        carregar()
    }
    
    func adicionarAlerta( mensagem: String, cor: String) {
        let novo = Alerta(id: UUID(), data: Date(), mensagem: mensagem, cor: cor)
        historico.append(novo)
        salvar()
    }
    
    private func salvar() {
        if let dados = try? JSONEncoder().encode(historico) {
            UserDefaults.standard.set(dados, forKey: chave)
        }
    }
    
    private func carregar() {
        if let dados = UserDefaults.standard.data(forKey: chave),
           let alertas = try? JSONDecoder().decode([Alerta].self, from: dados) {
            historico = alertas
        }
    }
}

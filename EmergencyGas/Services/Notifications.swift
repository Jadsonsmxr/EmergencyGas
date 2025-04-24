//
//  Notifications.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 29/03/25.
//


import UIKit

func sendNotification(title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title       // Título da notificação
    content.body = body         // Texto da notificação
    content.sound = .default    // Som padrão ao receber a notificação
    
    // Define um tempo para exibir a notificação (1 segundo depois)
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    
    // Criando a notificação
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Adicionando a notificação no sistema
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("❌ Erro ao agendar notificação: \(error.localizedDescription)")
        } else {
            print("📢 Notificação enviada com sucesso!")
        }
    }
}

//
//  ColorHelper.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 22/03/25.
//

import UIKit

func trocadeCor(_ message: String) -> UIColor {
    switch message.lowercased() {
    case "green":
        return .green
    case "red":
        return .red
    case "yellow":
        return .yellow
    default:
        return .green
    }
}

func trocadeStatus(_ message: String) -> String {
    switch message.lowercased() {
    case "green":
        return "Ambiente Seguro"
    case "red":
        return "Vazamento Detectado"
    case "yellow":
        return "Monitorando"
    default:
        return "Ambiente Seguro"
    }
}

func Notification(_ message: String) {
    switch message.lowercased() {
        
    case "yellow":
        sendNotification(title: "⚠️ Alerta!", body: "Possível vazamento de gás detectado! Verifique imediatamente.")
    case "red":
        sendNotification(title: "🆘 Alerta!", body: "Um vazamento de gás foi detectado!")
    default:
        print ("Sem necessidade de notificação")
        
    }
}

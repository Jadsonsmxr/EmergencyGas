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


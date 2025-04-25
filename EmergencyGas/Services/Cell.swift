//
//  Cell.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 24/04/25.
//

import UIKit

class AlertaCell: UITableViewCell {
    
    
     lazy var ledView: UIView = {
        let ledView = UIView()
        ledView.backgroundColor = .green
        ledView.translatesAutoresizingMaskIntoConstraints = false
        ledView.layer.cornerRadius = 10
        ledView.clipsToBounds = true
        return ledView
    }()
    
    private lazy var mensagemLabel: UILabel = {
        let mensagemLabel = UILabel()
        // Label
        mensagemLabel.translatesAutoresizingMaskIntoConstraints = false
        mensagemLabel.textColor = .white
        mensagemLabel.numberOfLines = 0
        
        return mensagemLabel
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        //setupcellConstraints()
        addSubview()
        
        // Constraints
        NSLayoutConstraint.activate([
            ledView.widthAnchor.constraint(equalToConstant: 20),
            ledView.heightAnchor.constraint(equalToConstant: 20),
            ledView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ledView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//
            mensagemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mensagemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mensagemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mensagemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
   
       
        
       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubview() {
        contentView.addSubview(ledView)
        contentView.addSubview(mensagemLabel)
    }
    
   
    
    
    func configurarCom(alerta: Alerta) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        ledView.backgroundColor = trocadeCor(alerta.cor)
        mensagemLabel.text = "\(alerta.mensagem)\n\(formatter.string(from: alerta.data))"
        
       
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}


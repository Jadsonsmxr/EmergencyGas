//
//  ViewController.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 17/03/25.
//
import UIKit
import CocoaMQTT

class HomeViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Detector de gás: 01"
        title.font = .systemFont(ofSize: 32, weight: .bold)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Ambiente Seguro"
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var spacer1: UIView = {
        let spacer1 = UIView()
        spacer1.translatesAutoresizingMaskIntoConstraints = false
        
        return spacer1
    }()
    
    private lazy var buttonLabel: UIButton = {
        let button = UIButton()
        button.setTitle("SOS", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(callEmergency), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonInstruction: UIButton = {
        let buttonInstruction = UIButton()
        buttonInstruction.setTitle("Instruções", for: .normal)
        buttonInstruction.backgroundColor = .buttonBackground
        buttonInstruction.setTitleColor(.white, for: .normal)
        buttonInstruction.layer.cornerRadius = 20
        buttonInstruction.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonInstruction.translatesAutoresizingMaskIntoConstraints = false
        buttonInstruction.addTarget(self, action: #selector(buttonInstructionPressed), for: .touchUpInside)
        return buttonInstruction
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [statusView, statusLabel, spacer1 ,buttonLabel, buttonInstruction])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var mqtt: CocoaMQTT?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        mqtt = CocoaMQTT(clientID: clientID, host: "mqtt.eclipseprojects.io", port: 1883)
        
        guard let mqtt = mqtt else {
            print("Erro ao inicializar MQTT")
            return
        }
        
        mqtt.keepAlive = 60
        mqtt.delegate = self
        _ = mqtt.connect()
        
        addSubviews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        statusView.layer.cornerRadius = statusView.frame.width / 2
        statusView.layer.masksToBounds = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusView.widthAnchor.constraint(equalToConstant: 100),
            statusView.heightAnchor.constraint(equalTo: statusView.widthAnchor),
            buttonLabel.widthAnchor.constraint(equalToConstant: 300),
            buttonLabel.heightAnchor.constraint(equalToConstant: 60),
            spacer1.heightAnchor.constraint(equalToConstant: 200),
            buttonInstruction.widthAnchor.constraint(equalToConstant: 300),
            buttonInstruction.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func addSubviews() {
        view.addSubview(stackView)
        view.addSubview(titleLabel)
    }
    
    @objc func callEmergency() {
        if let phoneURL = URL(string: "tel://193"),
           UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL)
        } else {
            print("Não é possível fazer a ligação.")
        }
    }
    @objc private func buttonInstructionPressed () {
        navigationController?.pushViewController(InstructionViewController(), animated: true)
    }
}

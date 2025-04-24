//
//  InstructionViewController.swift
//  EmergencyGas
//
//  Created by Jadson Maciel on 24/03/25.
//

import UIKit

class InstructionViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Em caso de vazamento de gás de cozinha, deve-se:"
        title.font = .systemFont(ofSize: 27, weight: .bold)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    private lazy var text1Label: UILabel = {
        let body = UILabel()
        body.text = "1. Fechar o registro de gás"
        body.font = .systemFont(ofSize: 20, weight: .light)
        body.textColor = .white
        body.translatesAutoresizingMaskIntoConstraints = false
        
        body.numberOfLines = 0
        return body
    }()
    
    private lazy var registerImage: UIImageView = {
        let registerImage = UIImageView(image: .registergas)
        registerImage.translatesAutoresizingMaskIntoConstraints = false
        registerImage.contentMode = .scaleAspectFit
        return registerImage
    }()
    
    private lazy var text2Label: UILabel = {
        let body1 = UILabel()
        body1.text = "2. Afastar pessoas e animais do local"
        body1.font = .systemFont(ofSize: 20, weight: .light)
        body1.textColor = .white
        body1.translatesAutoresizingMaskIntoConstraints = false
        body1.numberOfLines = 0
        return body1
    }()
    
    private lazy var evacuationImage: UIImageView = {
        let evacuationImage = UIImageView(image: .evacuation)
        evacuationImage.translatesAutoresizingMaskIntoConstraints = false
        evacuationImage.contentMode = .scaleAspectFit
        return evacuationImage
    }()
    
    private lazy var text3Label: UILabel = {
        let body2 = UILabel()
        body2.text = "3. Ventilar o ambiente abrindo portas e janelas"
        body2.font = .systemFont(ofSize: 20, weight: .light)
        body2.textColor = .white
        body2.translatesAutoresizingMaskIntoConstraints = false
        body2.numberOfLines = 0
        return body2
    }()
    
    private lazy var windowImage: UIImageView = {
        let windowImage = UIImageView(image: .openingWindow)
        windowImage.translatesAutoresizingMaskIntoConstraints = false
        windowImage.contentMode = .scaleAspectFit
        return windowImage
    }()
    
    private lazy var text4Label: UILabel = {
        let body3 = UILabel()
        body3.text = "4. Não acender luzes ou usar aparelhos elétricos"
        body3.font = .systemFont(ofSize: 20, weight: .light)
        body3.textColor = .white
        body3.translatesAutoresizingMaskIntoConstraints = false
        body3.numberOfLines = 0
        return body3
    }()
    
    private lazy var eletricImage: UIImageView = {
        let eletricImage = UIImageView(image: .eletric)
        eletricImage.translatesAutoresizingMaskIntoConstraints = false
        eletricImage.contentMode = .scaleAspectFit
        return eletricImage
    }()
    
    private lazy var text5Label: UILabel = {
        let body4 = UILabel()
        body4.text = "5. Chamar um profissional especializado"
        body4.font = .systemFont(ofSize: 20, weight: .light)
        body4.textColor = .white
        body4.translatesAutoresizingMaskIntoConstraints = false
        body4.numberOfLines = 0
        return body4
    }()
    
    private lazy var professionalImage: UIImageView = {
        let professionalImage = UIImageView(image: .callprofissional)
        professionalImage.translatesAutoresizingMaskIntoConstraints = false
        professionalImage.contentMode = .scaleAspectFit
        return professionalImage
    }()
   
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [text1Label, registerImage, text2Label, evacuationImage, text3Label, windowImage, text4Label, eletricImage, text5Label, professionalImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupUI()
        contentAddSubViews()
        setupConstraints()
     
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    
    
    
 
    func setupConstraints() {
        let viewSF = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: viewSF.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: viewSF.bottomAnchor)
        ])
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -42),

            registerImage.heightAnchor.constraint(equalToConstant: 200),

            evacuationImage.heightAnchor.constraint(equalToConstant: 200),

            windowImage.heightAnchor.constraint(equalToConstant: 200),
            
            eletricImage.heightAnchor.constraint(equalToConstant: 200),
            
            professionalImage.heightAnchor.constraint(equalToConstant: 200)

            
        ])
    }
    
    
    func contentAddSubViews() {
       
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackView)

    }


    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

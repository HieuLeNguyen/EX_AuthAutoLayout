//
//  ViewController.swift
//  EX_AuthAL
//
//  Created by Nguyễn Văn Hiếu on 30/9/24.
//

import UIKit

let accentColor = UIColor(red: 255/255, green: 174/255, blue: 72/255, alpha: 1)

class GuestViewController: UIViewController {
    
    //MARK: - Properies
    private let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Best app for your trip"
        label.font = .systemFont(ofSize: .init(36), weight: .medium)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
//    lazy var thay thế cho let loại bỏ cảnh báo của swift về: self
    
    lazy private var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(accentColor, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: .init(16), weight: .bold)
        
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)

        button.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
        return button
    }()
    
    lazy private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: .init(16), weight: .bold)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = accentColor
        
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)
        
        button.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)

        return button
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camtrai_bautroisao")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // autolayout cho chiều ngang
    private var buttonStackViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - View Will Transition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { [self] _ in
            
            if size.width > size.height {
                buttonStackView.axis = .horizontal
                buttonStackViewHeightConstraint.constant = 80
            } else {
                buttonStackView.axis = .vertical
                buttonStackViewHeightConstraint.constant = 140
            }
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
}

extension GuestViewController {
        
    //MARK: - Setup Views
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(topContainerView)
        topContainerView.addSubview(sloganLabel)
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(signupButton)
        buttonStackView.addArrangedSubview(loginButton)
        
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints(){
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        sloganLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sloganLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            sloganLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor),
            sloganLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
        

        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 0),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        buttonStackViewHeightConstraint = buttonStackView.heightAnchor.constraint(equalToConstant: 140)
        buttonStackViewHeightConstraint.isActive = true
    }
    
    //MARK: - Handle event Touch
    @objc private func buttonTouchDown(_ sender: UIButton) {
        sender.backgroundColor = .lightGray // Màu nền khi nhấn
    }

    @objc private func buttonTouchUp(_ sender: UIButton) {
        sender.backgroundColor = sender == signupButton ? .white : accentColor // Màu nền khi nhả
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch sender {
        case loginButton:
            if let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                navigationController?.pushViewController(vc, animated: true)
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem?.tintColor = .white
            }
        default :
            if let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
                navigationController?.pushViewController(vc, animated: true)
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem?.tintColor = .white
            }
        }

    }
}


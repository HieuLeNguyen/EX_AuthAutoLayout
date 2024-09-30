//
//  RegisterViewController.swift
//  EX_AuthAL
//
//  Created by Nguyễn Văn Hiếu on 30/9/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camtrai_bautroisao")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let bottomContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        // Nhận một mảng bo tròn 4 góc theo trục tạo độ, áp dụng cho IOS * 11.0 >
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: .init(36), weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a new account"
        label.textColor = .white
        label.font = .systemFont(ofSize: .init(16), weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Fullname",
                                                             attributes: [.foregroundColor: accentColor])
        textField.backgroundColor = textFieldColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Your mail",
                                                             attributes: [.foregroundColor: accentColor])
        textField.backgroundColor = textFieldColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes: [.foregroundColor: accentColor])
        textField.backgroundColor = textFieldColor
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let confirmPwTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                             attributes: [.foregroundColor: accentColor])
        textField.backgroundColor = textFieldColor
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: .init(16), weight: .bold)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = accentColor
        
//        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
//        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
//        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)

        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account? Log In"
        label.font = .systemFont(ofSize: .init(14), weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // Container View: inside bottomContainerView
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    private let inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private let descCharterTextView: UITextView = {
        let _textView = UITextView()
        _textView.text = """
                        By creating an account, you agree to our
                        Terms of Service and Privacy Policy.
                        """
        _textView.textColor = .lightGray
        _textView.isEditable = false
        _textView.font = .systemFont(ofSize: .init(14), weight: .medium)
        _textView.textAlignment = .center
        _textView.isScrollEnabled = false
        _textView.backgroundColor = .clear
        return _textView
    }()
    
    private let eyeIcon = UIImageView(image: UIImage(systemName: "eye.slash"))
    
    private var isShowPw:Bool = false
    private var isShowPwCurrent:Bool = false
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Tap Show Password
    @objc private func tapShowPw() {
        if isShowPw {
            passwordTextField.isSecureTextEntry = false
            isShowPw = false
            eyeIcon.image = UIImage(systemName: "eye")
        } else {
            passwordTextField.isSecureTextEntry = true
            isShowPw = true
            eyeIcon.image = UIImage(systemName: "eye.slash")
        }
    }

}

extension RegisterViewController {
    
    //MARK: - Setup Views
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(topContainerView)
        view.addSubview(bottomContainerView)
        
        topContainerView.addSubview(titleLabel)
        topContainerView.addSubview(subtitleLabel)
        
        bottomContainerView.addSubview(containerView)

        containerView.addSubview(inputStackView)
        containerView.addSubview(descCharterTextView)
        
        //add StackView
        inputStackView.addArrangedSubview(fullNameTextField)
        inputStackView.addArrangedSubview(emailTextField)
        inputStackView.addArrangedSubview(passwordTextField)
        inputStackView.addArrangedSubview(confirmPwTextField)

        containerView.addSubview(loginButton)
        containerView.addSubview(descriptionLabel)
        
        //add and customize icon position
        ///(cần thêm UIView bọc ngoài icon và là subclass của leftView, rightView)
        let emailIcon = UIImageView(image: UIImage(systemName: "envelope.fill"))
        emailIcon.tintColor = accentColor
        emailIcon.frame = CGRect(x: 8,
                                 y: 2,
                                 width: 20,
                                 height: 20)
        let emailView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 36,
                                             height: 24))
        emailView.addSubview(emailIcon)
        emailTextField.leftView = emailView
        emailTextField.leftViewMode = .always

        let lockIcon = UIImageView(image: UIImage(systemName: "lock.fill"))
        lockIcon.tintColor = accentColor
        lockIcon.frame = CGRect(x: 8,
                                y: 2,
                                width: 20,
                                height: 20)
        let lockView = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 36,
                                            height: 24))
        lockView.addSubview(lockIcon)
        passwordTextField.leftView = lockView
        passwordTextField.leftViewMode = .always
        
        
        eyeIcon.tintColor = accentColor
        eyeIcon.frame = CGRect(x: 8,
                               y: 2,
                               width: 20,
                               height: 20)
        let eyeView = UIView(frame: CGRect(x: 0,
                                           y: 0,
                                           width: 44,
                                           height: 24))
        eyeView.addSubview(eyeIcon)
        passwordTextField.rightView = eyeView
        passwordTextField.rightView?.isUserInteractionEnabled = true
        passwordTextField.rightViewMode = .always
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapShowPw))
        passwordTextField.rightView?.addGestureRecognizer(tapGesture)

    }
    
    //MARK: - Setup Constraints
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3/4)
        ])
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topContainerView.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: -10),
            topContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            topContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 60),
            containerView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: bottomContainerView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: .init(40))
        ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            subtitleLabel.heightAnchor.constraint(equalToConstant: .init(20))
        ])
        
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 70),
            inputStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            inputStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            inputStackView.heightAnchor.constraint(equalToConstant: .init(200))
        ])
        
        descCharterTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descCharterTextView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20),
            descCharterTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            descCharterTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            descCharterTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -46),
            loginButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            loginButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 0),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            descriptionLabel.heightAnchor.constraint(equalToConstant: .init(20))
        ])
    }
}

//
//  IdentificationViewController.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import UIKit

class IdentificationViewController: UIViewController {
    
    private let viewModel : IdentificationViewModel
    var onOTPRequired: ((String,String, [SaccoModel]) -> Void)?
    
    init(viewModel: IdentificationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoImg : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "logo")
        return img
        
    }()
    
    private let myTitle : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Welcome to Sacco Banking"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return lb
    }()
    
    private let subTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Let's find your sacco account"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return lb
        
    }()
    
    private let lbTextFieldLabel : UILabel = {
        let lb = UILabel()
        lb.text = " National ID"
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.textColor =  .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    private let idTextField : UITextField = {
        let tx = UITextField()
        tx.borderStyle = .roundedRect
        tx.placeholder = "Enter the national Id linked to your Sacco"
        tx.keyboardType = .numberPad
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    private let hintLabel : UILabel = {
        let lb = UILabel()
        lb.text = "We use this to securely confirm your Sacco membership"
        lb.textColor = .black
        lb.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.08)
        lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lb.numberOfLines = 0
        lb.layer.cornerRadius = 8
        lb.layer.masksToBounds = true
        lb.layer.borderWidth = 1
        lb.layer.borderColor = UIColor.green.cgColor
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
        
    }()
    
    private let submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.isEnabled = false
        btn.alpha = 0.5
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let activityIndicator : UIActivityIndicatorView = {
        let inidicator = UIActivityIndicatorView(style: .medium)
        inidicator.color = .systemGreen
        inidicator.hidesWhenStopped = true
        inidicator.translatesAutoresizingMaskIntoConstraints = false
        return inidicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImg)
        view.addSubview(myTitle)
        view.addSubview(subTitle)
        view.addSubview(lbTextFieldLabel)
        view.addSubview(idTextField)
        view.addSubview(hintLabel)
        view.addSubview(submitButton)
        view.addSubview(activityIndicator)
        
        idTextField.addTarget(self, action: #selector(idFieldChanged), for: .editingChanged)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: 200),
            logoImg.widthAnchor.constraint(equalToConstant: 200),
            
            myTitle.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 40),
            myTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subTitle.topAnchor.constraint(equalTo: myTitle.bottomAnchor, constant: 8),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            lbTextFieldLabel.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant:30),
            lbTextFieldLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lbTextFieldLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            idTextField.topAnchor.constraint(equalTo: lbTextFieldLabel.bottomAnchor, constant: 8),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            hintLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 12),
            hintLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            hintLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            hintLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            submitButton.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 24),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            
            activityIndicator.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

        ])
    }
    
    private func bindViewModel() {
        viewModel.onValidationChanged = {[weak self] isValid in
            guard let self else {return}
            submitButton.isEnabled = isValid
            submitButton.alpha = isValid ? 1.0 : 0.5
            
        }
        
        viewModel.onFetchingChanged = {[weak self] isFetching in
            guard let self else {return}
            idTextField.isEnabled = !isFetching
            submitButton.isEnabled = !isFetching && !idTextField.text!.isEmpty
            submitButton.alpha = isFetching ? 0.5 : 1.0
            isFetching ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
            hintLabel.text = isFetching ? "Fetching your Sacco account" : "We use this to securely confirm your Sacco membership."
            
        }
        
        viewModel.onOTPRequired = {[weak self] maskedPhone,otp,saccos in
            self?.onOTPRequired?(maskedPhone,otp,saccos)
        }
    }
    
    @objc private func idFieldChanged() {
        viewModel.nationalId = idTextField.text ?? ""
    }
    
    @objc private func submitTapped() {
        view.endEditing(true)
        viewModel.submit()
    }
    
    
}

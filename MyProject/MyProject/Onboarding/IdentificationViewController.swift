//
//  IdentificationViewController.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import UIKit

class IdentificationViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let mytitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Welome to Sacco Banking"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return lb
    }()
    
    private let subTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "lets find your Sacco account"
        lb.textColor = .black
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return lb
    }()
    
    private let lbTextField : UILabel = {
        let lb = UILabel()
        lb.text = "National ID"
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let idTextfield: UITextField = {
        let tx = UITextField()
        tx.borderStyle = .roundedRect
        tx.placeholder = "Enter the National ID linked to your Sacco"
        tx.keyboardType = .numberPad
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.isEnabled = false
        button.layer.cornerRadius = 8
        return button
    }()

    private let activityIndicator : UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView()
        indicator.color = .green
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(logoImageView)
        view.addSubview(mytitle)
        view.addSubview(subTitle)
        view.addSubview(lbTextField)
        view.addSubview(idTextfield)
        view.addSubview(submitButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            mytitle.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            mytitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mytitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            subTitle.topAnchor.constraint(equalTo: mytitle.bottomAnchor, constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            lbTextField.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 30),
            lbTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lbTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            idTextfield.topAnchor.constraint(equalTo: lbTextField.bottomAnchor, constant: 15),
            idTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            idTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            submitButton.topAnchor.constraint(equalTo: idTextfield.bottomAnchor, constant: 70),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            submitButton.heightAnchor.constraint(equalToConstant: 50)

            
            
        ])
    }
   

   

}

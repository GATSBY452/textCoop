//
//  GetStartedViewController.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//



import UIKit

class GetStartedViewController: UIViewController {
    
    var onGetStarted: (() -> Void)?
    
    private let logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "logo")
        return img
        
    }()
    
    private let titleDescription: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Save, borrow, and\n transact anytime"
        lb.textColor = .systemGreen
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        return lb
    }()
    
    private let moneyJarImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "bg")
        return img
    }()
    
    private let getStartedBt: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Get Started", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .systemGreen
        bt.layer.cornerRadius = 8
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(moneyJarImg)
        view.addSubview(logoImageView)
        view.addSubview(titleDescription)
        view.addSubview(getStartedBt)
        
        getStartedBt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 56),
            
            titleDescription.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            moneyJarImg.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 32),
            moneyJarImg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyJarImg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moneyJarImg.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moneyJarImg.heightAnchor.constraint(equalToConstant: 530),
            
            getStartedBt.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            getStartedBt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            getStartedBt.heightAnchor.constraint(equalToConstant: 50),
            getStartedBt.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }
    
    @objc private func buttonTapped() {
        onGetStarted?()
    }
    
}

//
//  GetStartedViewController.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//



import UIKit

class GetStartedViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let backgroundBg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "bg")
        return imageView
    }()
    
    private let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let titleDescription: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Save, borrow, and\ntransact anytime"
        lb.textColor = .systemGreen
        lb.numberOfLines = 0
        lb.font = UIFont.systemFont(ofSize: 45, weight: .medium)
        return lb
    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        view.addSubview(backgroundBg)
        view.addSubview(logoImageView)
        view.addSubview(titleDescription)
        view.addSubview(getStartedButton)
        
        getStartedButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundBg.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundBg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundBg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundBg.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleDescription.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),

            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)

            
                                                  
        ])
    }
    
    @objc  private func buttonTapped() {
        let vc = IdentificationViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("navigating")
    }
  

}

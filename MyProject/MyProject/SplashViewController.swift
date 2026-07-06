//
//  SplashViewController.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import UIKit

class SplashViewController: UIViewController {
    
    var onFinish: (() -> Void)?
    
    private let displayDuration: TimeInterval = 2.0
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let activityIndicator : UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView()
        indicator.color = .green
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
        
    }()

  
    private let subLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "smallLogo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        simulateSSLRequest()
    }
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        view.addSubview(logoImageView)
        view.addSubview(activityIndicator)
        view.addSubview(subLogoImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 240),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            activityIndicator.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 20),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 44),
            activityIndicator.widthAnchor.constraint(equalToConstant: 44),
            
            subLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLogoImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -24),
            subLogoImageView.widthAnchor.constraint(equalToConstant: 100),
            subLogoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    


    
    private func simulateSSLRequest() {
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){ [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.onFinish?()
        }
        
        
    }
    
  

}

//
//  SaccoSelectionVC.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import UIKit

class SaccoSelectionVC: UIViewController {
    
    private let saccos: [SaccoModel]
    var onSaccoSelected: ((SaccoModel) -> Void)?
    var onBack: (() -> Void)?
    
    init(saccos: [SaccoModel]){
        self.saccos = saccos
        super.init(nibName: nil,bundle: nil)
    }
                  
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    let backButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        bt.tintColor = .label
        return bt
    }()
    
    private let logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "logo")
        return img
        
    }()
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Choose your Sacco"
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return lb
    }()
    
    private lazy var infoBanner = InfoBanner(text: Self.infoBannerText())
    
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.register(SaccoCell.self, forCellReuseIdentifier: SaccoCell.reuseIdentifier)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setUpUI()
        setupConstraints()
    }
    
    private func setUpUI() {
        view.addSubview(backButton)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(infoBanner)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            logoImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 12),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 56),
            
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            infoBanner.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            infoBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            tableView.topAnchor.constraint(equalTo: infoBanner.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func backTapped() {
        onBack?()
    }
    
    private static func infoBannerText() -> NSAttributedString {
        let full = "we found the following Sacco accounts linked to your ID. Please select an account to proceed."
        let attributed = NSMutableAttributedString(
            string: full,
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.systemGreen
            ]
        )
        
        let boldFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        for term in ["Sacco accounts", "ID"] {
            let range = (full as NSString).range(of: term)
            if range.location != NSNotFound {
                attributed.addAttribute(.font, value: boldFont, range: range)
            }
        }
        
        return attributed
    }
    

}

extension SaccoSelectionVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        saccos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SaccoCell.reuseIdentifier,for: indexPath) as! SaccoCell
        cell.configure(with: saccos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onSaccoSelected?(saccos[indexPath.row])
    }
    
    
}

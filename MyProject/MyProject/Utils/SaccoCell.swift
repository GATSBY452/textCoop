//
//  SaccoCell.swift
//  MyProject
//
//  Created by Yusuf Abbas on 06/07/2026.
//

import Foundation
import UIKit

class SaccoCell : UITableViewCell {
    
    static let reuseIdentifier = "SaccoCell"
    
    private let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.06
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 22
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray6
        return iv
        
        
    }()
    
    private let namelabel: UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lb.numberOfLines = 2
        return lb
    }()
    
    private let chevronView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "chevron.right"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = .systemGreen
        return iv
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(cardView)
        cardView.addSubview(logoImageView)
        cardView.addSubview(namelabel)
        cardView.addSubview(chevronView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            cardView.heightAnchor.constraint(equalToConstant: 72),
            
            logoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            logoImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 44),
            logoImageView.heightAnchor.constraint(equalToConstant: 44),
            
            
            namelabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 14),
            namelabel.trailingAnchor.constraint(equalTo: chevronView.leadingAnchor, constant: -12),
            namelabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            namelabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            namelabel.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -14),
            
            chevronView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            chevronView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            chevronView.widthAnchor.constraint(equalToConstant: 14)
            
        ])
        
    
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configure(with sacco: SaccoModel){
        namelabel.text = sacco.name
        logoImageView.image = UIImage(named: sacco.logoAssetName)
    }
    
}

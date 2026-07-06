//
//  Coordinator.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}

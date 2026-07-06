//
//  AppCoordinator.swift
//  MyProject
//
//  Created by Yusuf Abbas on 03/07/2026.
//

import UIKit
import SwiftUI

class AppCoordinator : Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        showSplash()
    }
    
    private func showSplash() {
        let splashVC = SplashViewController()
        splashVC.onFinish = {[weak self] in
        
            self?.showGetStarted()
        }
       
        navigationController.setViewControllers([splashVC], animated: true)
    }
    
    
    private func showGetStarted() {
        let vc = GetStartedViewController()
        vc.onGetStarted = {[weak self] in
        
            self?.showIdentification()
        }
        
        navigationController.setViewControllers([vc], animated: true)
    }
    
    private func showIdentification() {
        let viewModel = IdentificationViewModel()
        let vc = IdentificationViewController(viewModel: viewModel)
        
        vc.onOTPRequired = {[weak self] maskedPhone,otp,saccos in
            self?.presentOTP(maskedPhone: maskedPhone, otp: otp){
                self?.showSaccoSelection(saccos)
            }
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
//    private func presentOTP(maskedPhone: String,otp: String, saccos: [SaccoModel]){
//        
//        let otpViewModel = OTPViewModel(maskedPhone: maskedPhone,expectedOTP: otp)
//        let hosting = UIHostingController(rootView: OTPView(viewModel: otpViewModel))
//        
//        if let sheet = hosting.sheetPresentationController {
//            sheet.detents = [.medium()]
//            sheet.prefersGrabberVisible = true
//        }
//        
//        otpViewModel.onVerified = {[weak self,weak hosting] in
//            hosting?.dismiss(animated: true){
//                self?.showSaccoSelection(saccos)
//            }
//            
//        }
//        navigationController.present(hosting,animated: true)
//    }
    
    private func presentOTP(maskedPhone: String,otp: String, onVerified: @escaping () -> Void){
        
        let otpViewModel = OTPViewModel(maskedPhone: maskedPhone,expectedOTP: otp)
        let hosting = UIHostingController(rootView: OTPView(viewModel: otpViewModel))
        
        if let sheet = hosting.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
        otpViewModel.onVerified = {[weak hosting] in
            hosting?.dismiss(animated: true,completion: onVerified)
        }
        
        navigationController.present(hosting,animated: true)
    }
    
    private func  showSaccoSelection(_ saccos: [SaccoModel]) {
   
        let vc = SaccoSelectionVC(saccos: saccos)
        vc.onBack = {[weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        
        vc.onSaccoSelected = {[weak self] sacco in
            print("Selected Sacco: \(sacco.name)")
            self?.showLogin(for: sacco)
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showLogin(for sacco: SaccoModel) {
        let viewModel = LoginViewModel(sacco: sacco)
        let hosting = UIHostingController(
            rootView: LoginView(
                viewModel: viewModel,
                onSwitchSacco: { [weak self] in
                    self?.navigationController.popViewController(animated: true)
                    
                }
            )
        )
        
        viewModel.onLoginSucceeded = {[weak self] maskedPhone, otp in
            
            self?.presentOTP(maskedPhone: maskedPhone, otp: otp) {
                self?.showDashboard()
            }
            
        }
        
        navigationController.pushViewController(hosting, animated: true)
    }
    
    private func showDashboard() {
        let hosting = UIHostingController(rootView: DashBoardView())
        navigationController.setViewControllers([hosting], animated: true)
    }
    
    
}

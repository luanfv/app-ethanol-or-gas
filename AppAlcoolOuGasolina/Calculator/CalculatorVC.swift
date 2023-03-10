//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Luan Franca Vieira on 08/03/23.
//

import UIKit

class CalculatorVC: UIViewController {
    var screen: CalculatorScreen?
    var alert: Alert?

    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextFields() -> Bool {
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do álcool e da gasolina")
            
            return false
        }
        
        if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valore do álcool")
            
            return false
        }
        
        if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe o valor da gasolina")
            
            return false
        }
        
        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        if validateTextFields() {
            return
        }
        
        let formatter =  NumberFormatter()
        formatter.numberStyle = .decimal
        
        let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        if ethanolPrice / gasPrice > 0.7 {
            print("Melhor utilizar Gasolina")
        } else {
            print("Melhor utilizar Álcool")
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

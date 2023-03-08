//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Luan Franca Vieira on 08/03/23.
//

import UIKit

class CalculatorVC: UIViewController {
    var screen: CalculatorScreen?

    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        print(#function)        
    }
    
    func tappedBackButton() {
        print(#function)
    }
}

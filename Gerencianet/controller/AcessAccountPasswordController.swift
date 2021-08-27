//
//  AcessAccountPasswordController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 22/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class AcessAccountPasswordController: UIViewController {
    //IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var viewDimmer: UIView!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var lineCard: UIView!
    @IBOutlet weak var cardConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelTermosDeUso: UILabel!
    
    var backingImage: UIImage?
    
    override func viewDidLoad() {
        configLabelPassword()
        configCard()
        configTermosDeUso()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCard()
    }
    
    fileprivate func configLabelPassword() {
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 18.0)!
        ]
        
        let regularText = NSAttributedString(string: "Informe sua " , attributes: regularAttribute)
        
        let boldText = NSAttributedString(string: "senha", attributes: boldAttribute)
        
        let newString = NSMutableAttributedString()
        
        newString.append(regularText)
        newString.append(boldText)
        
        labelPassword.attributedText = newString
    }
    
    fileprivate func configTermosDeUso() {
        let boldAttributeTermos = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 11.0)!,
            .foregroundColor : UIColor.systemBlue,
        ]
        
        let regularAttributeTermos = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 11.0)!
        ]
        
        let regularText = NSAttributedString(string: "Este acesso é protegido pelo reCAPTCHA e está sujeito a " , attributes: regularAttributeTermos)
        
        let boldText = NSAttributedString(string: "Política de privacidade ", attributes: boldAttributeTermos)
        
        let regularText2 = NSAttributedString(string: "e aos " , attributes: regularAttributeTermos)
        
        let boldText2 = NSAttributedString(string: "Termos de serviço ", attributes: boldAttributeTermos)
        
        let regularText3 = NSAttributedString(string: "do Google." , attributes: regularAttributeTermos)
        
        
        let newString = NSMutableAttributedString()
        
        newString.append(regularText)
        newString.append(boldText)
        newString.append(regularText2)
        newString.append(boldText2)
        newString.append(regularText3)
        
        
        labelTermosDeUso.attributedText = newString
    }
    
    fileprivate func configCard() {
        image.image = backingImage
        
        card.clipsToBounds = true
        card.layer.cornerRadius = 10.0
        card.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        lineCard.clipsToBounds = true
        lineCard.layer.cornerRadius = 3
        
        let myColor = UIColor.orange
        passwordTextField.layer.borderColor = myColor.cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1.0
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        viewDimmer.alpha = 0.0
        
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        viewDimmer.addGestureRecognizer(dimmerTap)
        viewDimmer.isUserInteractionEnabled = true
    }
    
    @IBAction func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideCardAndGoBack()
    }
    
    private func hideCardAndGoBack() {
        
        self.view.layoutIfNeeded()
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        hideCard.addAnimations {
            self.viewDimmer.alpha = 0.0
        }
        
        hideCard.addCompletion({ position in
            if position == .end {
                if(self.presentingViewController != nil) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        })
        
        hideCard.startAnimation()
    }
    
    //MARK: Animations
    private func showCard() {
        
        self.view.layoutIfNeeded()
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            
            cardConstraint.constant = (safeAreaHeight + bottomPadding) / 3.0
        }
        
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        showCard.addAnimations({
            self.viewDimmer.alpha = 0.7
        })
        
        showCard.startAnimation()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

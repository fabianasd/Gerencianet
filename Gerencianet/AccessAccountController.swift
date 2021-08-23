//
//  AccessAccountController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 12/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class AccessAccountController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dimmer: UIView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var cardLine: UIView!
    @IBOutlet weak var cardConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelCPFEmail: UILabel!
    @IBOutlet weak var textFieldCPFEmail: UITextField!
    @IBOutlet weak var avancarButton: UIButton!
    
    var backingImage: UIImage?
    
    override func viewDidLoad() {
        configLabel()
        configCard()
       // configBorder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCard()
    }
    
    fileprivate func configLabel() {
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 18.0)!
        ]
        
        let regularText = NSAttributedString(string: "Digite seu " , attributes: regularAttribute)
        
        let boldText = NSAttributedString(string: "CPF", attributes: boldAttribute)
        
        let regularText1 = NSAttributedString(string: " ou " , attributes: regularAttribute)
        
        let boldText1 = NSAttributedString(string: "e-mail", attributes: boldAttribute)
        
        
        let newString = NSMutableAttributedString()
        newString.append(regularText)
        newString.append(boldText)
        
        newString.append(regularText1)
        newString.append(boldText1)
        labelCPFEmail.attributedText = newString
    }
    
    fileprivate func configCard() {
        imageView.image = backingImage
        
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 10.0
        viewCard.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        cardLine.clipsToBounds = true
        cardLine.layer.cornerRadius = 3
        
        let myColor = UIColor.orange
        textFieldCPFEmail.layer.borderColor = myColor.cgColor
        textFieldCPFEmail.layer.cornerRadius = 5
        textFieldCPFEmail.layer.borderWidth = 1.0
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        dimmer.alpha = 0.0
        
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmer.addGestureRecognizer(dimmerTap)
        dimmer.isUserInteractionEnabled = true
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
            self.dimmer.alpha = 0.0
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
            self.dimmer.alpha = 0.7
        })
        
        showCard.startAnimation()
    }
    
    @IBAction func avancarButton( _ sender: UIButton) {
        guard let reactionVC = storyboard?.instantiateViewController(withIdentifier: "AcessAccountPasswordController")
            as? AcessAccountPasswordController else {
                
                assertionFailure("No view controller ID AcessAccountPasswordController in storyboard")
                return
        }
        reactionVC.backingImage = self.view.asImage()
        
        self.present(reactionVC, animated: false, completion: nil)
    }
}

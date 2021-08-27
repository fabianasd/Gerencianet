//
//  OpenAccountController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 16/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class OpenAccountController: UIViewController {
    //IBOutlets
    
    @IBOutlet weak var imagePrint: UIImageView!
    @IBOutlet weak var dimmerView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewLine: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var cardConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var labelCPFCNPJ: UILabel!
    @IBOutlet weak var labelOpenAccount: UILabel!
    
    @IBOutlet weak var cpfcnpfTextField: UITextField!
    
    var backingImage: UIImage?
    
    override func viewDidLoad() {
        configCard()
        openAccount()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showCard()
    }

    @IBAction func segmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            labelCPFCNPJ.text = "CPF"
        case 1:
            labelCPFCNPJ.text = "CNPJ"
        default:
            break
        }
        labelCPFCNPJ.textColor = .darkGray
    }
    
    fileprivate func openAccount() {
        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 18.0)!
        ]
        
        let regularText = NSAttributedString(string: "Abrir uma conta " , attributes: regularAttribute)
        
        let boldText = NSAttributedString(string: "Gerencianet", attributes: boldAttribute)
        
        let newString = NSMutableAttributedString()
        newString.append(regularText)
        newString.append(boldText)
        
        labelOpenAccount.attributedText = newString
        labelOpenAccount.textColor = .darkGray
    }
    
    fileprivate func configCard() {
        imagePrint.image = backingImage
        
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 10.0
        cardView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        cardViewLine.clipsToBounds = true
        cardViewLine.layer.cornerRadius = 3
    
        let myColor = UIColor.orange
        cpfcnpfTextField.layer.borderColor = myColor.cgColor
        cpfcnpfTextField.layer.cornerRadius = 5
        cpfcnpfTextField.layer.borderWidth = 1.0
        
        // hide the card view at the bottom when the View first load
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            cardConstraints.constant = safeAreaHeight + bottomPadding
        }
        
        // set dimmerview to transparent
        dimmerView.alpha = 0.0
        
        // dimmerViewTapped() will be called when user tap on the dimmer view
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmerView.addGestureRecognizer(dimmerTap)
        dimmerView.isUserInteractionEnabled = true
    }
    
    // @IBAction is required in front of the function name due to how selector works
    @IBAction func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideCardAndGoBack()
    }
    
    private func hideCardAndGoBack() {
        
        // ensure there's no pending layout changes before animation runs
        self.view.layoutIfNeeded()
        
        // set the new top constraint value for card view
        // card view won't move down just yet, we need to call layoutIfNeeded()
        // to tell the app to refresh the frame/position of card view
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            
            // move the card view to bottom of screen
            cardConstraints.constant = safeAreaHeight + bottomPadding
        }
        
        // move card down to bottom
        // create a new property animator
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // hide dimmer view
        // this will animate the dimmerView alpha together with the card move down animation
        hideCard.addAnimations {
            self.dimmerView.alpha = 0.0
        }
        
        // when the animation completes, (position == .end means the animation has ended)
        // dismiss this view controller (if there is a presenting view controller)
        hideCard.addCompletion({ position in
            if position == .end {
                if(self.presentingViewController != nil) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        })
        
        // run the animation
        hideCard.startAnimation()
    }
    
    //MARK: Animations
    private func showCard() {
        
        // ensure there's no pending layout changes before animation runs
        self.view.layoutIfNeeded()
        
        // set the new top constraint value for card view
        // card view won't move up just yet, we need to call layoutIfNeeded()
        // to tell the app to refresh the frame/position of card view
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            
            // when card state is normal, its top distance to safe area is
            // (safe area height + bottom inset) / 2.0
            cardConstraints.constant = (safeAreaHeight + bottomPadding) / 3.0
        }
        
        // move card up from bottom by telling the app to refresh the frame/position of view
        // create a new property animator
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // show dimmer view
        // this will animate the dimmerView alpha together with the card move up animation
        showCard.addAnimations({
            self.dimmerView.alpha = 0.7
        })
        
        // run the animation
        showCard.startAnimation()
    }
}

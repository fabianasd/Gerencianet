//
//  ReactionViewController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 12/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class ReactionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dimmer: UIView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var cardLine: UIView!

    @IBOutlet weak var cardConstraint: NSLayoutConstraint!
        
    var backingImage: UIImage?
    
    override func viewDidLoad() {
        
        imageView.image = backingImage
        
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 10.0
        viewCard.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        cardLine.clipsToBounds = true
        cardLine.layer.cornerRadius = 3
              cardLine.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        dimmer.alpha = 0.0
        
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmer.addGestureRecognizer(dimmerTap)
        dimmer.isUserInteractionEnabled = true
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showCard()
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
            
            cardConstraint.constant = (safeAreaHeight + bottomPadding) / 2.0
        }

        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })

        showCard.addAnimations({
            self.dimmer.alpha = 0.7
        })
        
        showCard.startAnimation()
    }
}

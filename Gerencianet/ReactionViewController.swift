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
    
    @IBOutlet weak var cardConstraint: NSLayoutConstraint!
    
    var backingImage: UIImage?
    
    override func viewDidLoad() {
        
        imageView.image = backingImage
        
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 10.0
        viewCard.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        // hide the card view at the bottom when the View first load
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        // set dimmerview to transparent
        dimmer.alpha = 0.0
        
        // dimmerViewTapped() will be called when user tap on the dimmer view
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmer.addGestureRecognizer(dimmerTap)
        dimmer.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showCard()
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
            cardConstraint.constant = safeAreaHeight + bottomPadding
        }
        
        // move card down to bottom
        // create a new property animator
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // hide dimmer view
        // this will animate the dimmerView alpha together with the card move down animation
        hideCard.addAnimations {
            self.dimmer.alpha = 0.0
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
            cardConstraint.constant = (safeAreaHeight + bottomPadding) / 2.0
        }
        
        // move card up from bottom by telling the app to refresh the frame/position of view
        // create a new property animator
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        // show dimmer view
        // this will animate the dimmerView alpha together with the card move up animation
        showCard.addAnimations({
            self.dimmer.alpha = 0.7
        })
        
        // run the animation
        showCard.startAnimation()
    }
}

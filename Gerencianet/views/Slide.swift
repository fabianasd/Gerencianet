//
//  Slide.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 08/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class Slide: UIView {
    
    @IBOutlet weak var labelTitle: UITextView!
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    
    
    private func showCard() {
        if let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom {
            
            // when card state is normal, its top distance to safe area is
            // (safe area height + bottom inset) / 2.0
            constraintBottom.constant = (safeAreaHeight + bottomPadding)/3.0
        }
        
    }
    
}

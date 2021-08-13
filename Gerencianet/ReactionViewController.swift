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
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var Dimmer: UIView!
    
    @IBOutlet weak var cardConstraint: NSLayoutConstraint!
    
    //
    
    var imagePrint: UIImage?
    
    override func viewDidLoad() {
        
            imageView.image = imagePrint
        
        viewCard.clipsToBounds = true
        viewCard.layer.cornerRadius = 10.0
        viewCard.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}

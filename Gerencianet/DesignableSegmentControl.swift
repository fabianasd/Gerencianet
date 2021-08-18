//
//  DesignableSegmentControl.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 17/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

@IBDesignable
    class DesignableSegmentControl: UISegmentedControl{
    }
    extension UISegmentedControl{
        @IBInspectable
        var textColor: UIColor{
            get {
                return self.textColor
            }
            set {
                let unselectedAttributes = [NSAttributedString.Key.foregroundColor: newValue,
                                            NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)]
                self.setTitleTextAttributes(unselectedAttributes, for: .normal)
                self.setTitleTextAttributes(unselectedAttributes, for: .selected)
            }
        }
    }

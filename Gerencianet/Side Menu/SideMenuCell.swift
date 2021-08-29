//
//  SideMenuCell.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 29/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self)}
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)}

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Background
        self.backgroundColor = .clear
        
        // Icon
        self.iconImageView.tintColor = .white
        
        // Title
        self.titleLabel.textColor = .white
    }
}

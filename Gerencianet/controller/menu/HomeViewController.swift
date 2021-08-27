//
//  HomeViewController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 26/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenuButton()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
    }
    
    
    @IBAction func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    
}

//
//  AtualizacaoCadastralViewController.swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 29/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//

import UIKit

class AtualizacaoCadastralViewController: UIViewController {

    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.sideMenuBtn.target = revealViewController()
            self.sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.revealViewController()?.gestureEnabled = false
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.revealViewController()?.gestureEnabled = true
        }
    }

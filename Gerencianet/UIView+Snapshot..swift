//
//  UIView+Snapshot..swift
//  Gerencianet
//
//  Created by Fabiana Petrovick on 12/08/21.
//  Copyright © 2021 Fabiana Petrovick. All rights reserved.
//


import UIKit

extension UIView  {

    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
}


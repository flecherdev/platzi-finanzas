//
//  Shadow.swift
//  PlatziFinanzas
//
//  Created by Ezequiel Freire on 25/05/2020.
//  Copyright © 2020 Ezequiel Freire. All rights reserved.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor {
        get {
            guard let color = layer.borderColor  else {
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        
        set {
            layer.borderColor = newValue.cgColor 
        }
    }
}

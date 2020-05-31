//
//  OnBordingStepsViewController.swift
//  PlatziFinanzas
//
//  Created by Ezequiel Freire on 30/05/2020.
//  Copyright © 2020 Ezequiel Freire. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    // referencias a nuestra estructura de datos (1)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var OnBoardingImageLabel  : UIImageView!

    var item : OnBoardingItem? //? el signo determina si es opcional (2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // asignamos la informacion de item a nuestro label (3)
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        OnBoardingImageLabel.image = UIImage(named: item?.imageName ?? "") // como el valor es opcional y el UIImage necesita uno
    }

}



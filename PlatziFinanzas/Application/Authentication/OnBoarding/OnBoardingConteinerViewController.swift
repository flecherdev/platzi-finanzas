//
//  OnBoardingConteinerViewController.swift
//  PlatziFinanzas
//
//  Created by Ezequiel Freire on 25/05/2020.
//  Copyright © 2020 Ezequiel Freire. All rights reserved.
//

import UIKit

class OnBoardingConteinerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // desde este punto se controlara el page view controler 
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        
        destination.pageControl = pageControl
    }
    

}

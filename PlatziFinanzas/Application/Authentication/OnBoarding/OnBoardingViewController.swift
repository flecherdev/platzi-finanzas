//
//  OnBoardingViewController.swift
//  PlatziFinanzas
//
//  Created by Ezequiel Freire on 25/05/2020.
//  Copyright © 2020 Ezequiel Freire. All rights reserved.
//

import UIKit

// estructura de datos que vamos a manejar (1)
struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    var pageControl: UIPageControl? // ! significa que se que existe ? es que no sabemos si lo puede pasar 
    
    // es una propiedad que solo se puede acceder desde este archivo (2)
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Save to money and reduce debt",
                description: "Press start button",
                imageName: "OnBoarding1"
            ),
            OnBoardingItem(
                title: "You've finished your onbording",
                description: "Press start button",
                imageName: "OnBoarding2"
            )
        ]
    }()
    
    // por cada item se crea un view controller del content (3)
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items =  [UIViewController]() // inicializamos una lista vacia
        
        for i in 0 ..< self.items.count { // 0 .. empieza del elemento 0
            items.append(self.instanceViewController(i))
        }
        
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self es una llamada asi mismo
        delegate = self
        dataSource = self
        
        // agregamos el page control (6)
        pageControl?.numberOfPages = items.count
        
        updateConteinerView(stepNumber: 0)
    }
    
    // funcion que actualiza el current a lo que nosotros queremos (7)
    func updateConteinerView(stepNumber index: Int) {
        setViewControllers([contentViewController[index]], direction: .forward, animated: true  , completion: nil)
    }
    
    // (lo que recibe) -> lo que retorna (4)
    func instanceViewController(_ index: Int ) -> UIViewController {
        // se inicializa con la referencia al story board
        guard let viewController =  UIStoryboard(name: "OnBording", bundle: Bundle.main )
            .instantiateViewController(withIdentifier: "OnBoardingSteps") // instancio el view controller
            as? OnBoardingStepsViewController else { // del tipo  y sino
                return UIViewController() 
        }
        
//        UIStoryboard(name: “Storyboard”, bundle: nil)

        // creamos
        viewController.item = items[index]
        return viewController
    }
}


// agreamos las extensiones de delegate y datasource (5)
extension OnBoardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.index(of: viewController)
        
        if index == 0 {
            return nil // esto indica que no hay nadie despues de este content
        }
        
        return contentViewController[index! + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = contentViewController.index(of: viewController)
        
        if index == contentViewController.count - 1 { // el maximo de sus elementos
            return nil // esto indica que no hay nadie despues de este conttent
        }
        
        return contentViewController[index! + 1]
    }
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    // el delegado tiene una funcion (8)
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // necesitamos el index para ese view controler
        guard let index = contentViewController.index(of: viewControllers!.first!) else {
            return
        }
        
        pageControl?.currentPage = index
    }
}


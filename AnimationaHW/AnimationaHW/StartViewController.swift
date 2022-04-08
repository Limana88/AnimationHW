//
//  StartViewController.swift
//  AnimationaHW
//
//  Created by Милана Махсотова on 08.04.2022.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var customUIView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleViewTap))
        customUIView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func handleViewTap() {
        
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! ViewController
        
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        
        present(secondViewController, animated: true, completion: nil)
    }

}

extension StartViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let startViewController = presenting as? StartViewController, let viewController = presented as? ViewController else { return nil }
        
        return AnimatedTransition(firstViewController: startViewController, secondViewController: viewController)
    }
    
}

//
//  ViewController.swift
//  curier
//
//  Created by Kerim Ilyasov on 10.12.2019.
//  Copyright © 2019 GB team. All rights reserved.
//

import UIKit
import SPStorkController
import SPFakeBar
class ViewController: UIViewController,SPStorkControllerDelegate{
   var presentControllerButton = UIButton.init(type: UIButton.ButtonType.system)
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.center = view.center
        label.bounds = view.bounds
        label.textAlignment = .center
        label.text = "curier"
        self.presentControllerButton.setTitle("Показать заказ", for: .normal)
          self.presentControllerButton.addTarget(self, action: #selector(self.presentModalViewController), for: .touchUpInside)
          self.presentControllerButton.sizeToFit()
          self.presentControllerButton.center.x = self.view.frame.width  / 2
          self.presentControllerButton.center.y = self.view.frame.height / 4 * 3
          self.view.addSubview(self.presentControllerButton)
        
//        let controller = ViewController()
//        self.presentAsStork(controller)
    }
    @objc func presentModalViewController() {
              let modal = OrderController()
              let transitionDelegate = SPStorkTransitioningDelegate()
              transitionDelegate.storkDelegate = self
             transitionDelegate.confirmDelegate = modal 
              modal.transitioningDelegate = transitionDelegate
              modal.modalPresentationStyle = .custom
              self.present(modal, animated: true, completion: nil)
          }
}


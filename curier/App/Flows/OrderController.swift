//
//  ModalViewController.swift
//  curier
//
//  Created by Чернецова Юлия on 18/12/2019.
//  Copyright © 2019 GB team. All rights reserved.
//

import UIKit
import SPStorkController
import SPFakeBar

class OrderController: UIViewController {
    var presentControllerButton = UIButton.init(type: UIButton.ButtonType.system)
    let navBar = SPFakeBarView(style: .stork)
    let orderView = OrderView()
    var lightStatusBar: Bool = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.lightStatusBar ? .lightContent : .default
    }

    override func loadView() {
        super.loadView()
        //self.view = OrderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.modalPresentationCapturesStatusBarAppearance = true
        self.navBar.titleLabel.text = "Данные по заказу"
        self.navBar.leftButton.setTitle("Отмена", for: .normal)
        self.navBar.leftButton.addTarget(self, action: #selector(self.dismissAction), for: .touchUpInside)
        self.view.addSubview(self.navBar)
        self.view.addSubview(self.orderView)
    }

    @objc func dismissAction() {
        SPStorkController.dismissWithConfirmation(controller: self, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.lightStatusBar = true
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

extension OrderController: SPStorkControllerConfirmDelegate {
    func confirm(_ completion: @escaping (Bool) -> ()) {
        
    }
    

    var needConfirm: Bool {
        return false
    }

//    func confirm(_ completion: @escaping (Bool) -> ()) {
//        let alertController = UIAlertController(title: "Need dismiss?", message: "It test confirm option for SPStorkController", preferredStyle: .actionSheet)
//        alertController.addDestructiveAction(title: "Confirm", complection: {
//            completion(true)
//        })
//        alertController.addCancelAction(title: "Cancel") {
//            completion(false)
//        }
//        self.present(alertController)
   // }
}


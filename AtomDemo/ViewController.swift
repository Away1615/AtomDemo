//
//  ViewController.swift
//  AtomDemo
//
//  Created by 白镜吾 on 2024/9/20.
//

import UIKit
import AtomKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.atm.fill

        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            AtomToast.showToast("Hello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello World", on: self.view)
        })
    }
}

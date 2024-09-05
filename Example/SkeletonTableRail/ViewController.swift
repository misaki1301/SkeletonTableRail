//
//  ViewController.swift
//  skeleton-table-rail
//
//  Created by misaki1301 on 02/04/2024.
//  Copyright (c) 2024 misaki1301. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
	func goToModule()
}

class ViewController: UIViewController, Storyboarded {
	
	weak var delegate: ViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
	@IBAction func goToSkeleton(_ sender: Any) {
		delegate?.goToModule()
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


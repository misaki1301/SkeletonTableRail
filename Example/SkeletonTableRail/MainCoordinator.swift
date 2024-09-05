//
//  MainCoordinator.swift
//  SkeletonTableRail_Example
//
//  Created by Paul Frank on 4/02/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SkeletonTableRail

protocol Storyboarded {
	static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
	static func instantiate() -> Self {
		let fullName = NSStringFromClass(self)
		
		let className = fullName.components(separatedBy: ".")[1]
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		return storyboard.instantiateViewController(withIdentifier: className) as! Self
	}
}

protocol Coordinator {
	var childCoordinators: [Coordinator] {get set}
	var navigationController: UINavigationController {get set}
	
	func start()
}

class MainCoordinator: Coordinator {
	
	private var window: UIWindow
	var childCoordinators: [Coordinator] = []
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController, window: UIWindow) {
		self.navigationController = navigationController
		self.window = window
	}
	
	func start() {
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		let vc = ViewController.instantiate()
		vc.delegate = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	func showSkeletonTableView() {
		let coordinator = SkeletonCoordinator(navController: navigationController, window: window)
		coordinator.start()
	}
}

extension MainCoordinator: ViewControllerProtocol {
	func goToModule() {
		showSkeletonTableView()
	}
}

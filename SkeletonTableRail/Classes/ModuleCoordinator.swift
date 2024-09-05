//
//  ModuleCoordinator.swift
//  SkeletonTableRail
//
//  Created by Paul Frank on 4/02/24.
//

import Foundation
import UIKit

protocol Coordinator {
	func start()
}

public class SkeletonCoordinator: Coordinator {
	private let navController: UINavigationController
	private let window: UIWindow
	
	public init(navController: UINavigationController, window: UIWindow) {
		self.navController = navController
		self.window = window
	}
	
	public func start() {
		window.rootViewController = navController
		window.makeKeyAndVisible()
		showMain()
	}
	
	private func showMain() {
		let bundle = Bundle(for: SkeletonViewController.self)
		let main = UIStoryboard(name: "Main", bundle: bundle)
		let controller = main.instantiateViewController(withIdentifier: "SkeletonViewController") as! SkeletonViewController
		navController.pushViewController(controller, animated: true)
	}
}

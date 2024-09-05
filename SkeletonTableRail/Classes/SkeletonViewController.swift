//
//  SkeletonViewController.swift
//  skeleton-table-rail
//
//  Created by Paul Frank on 4/02/24.
//

import UIKit

class SkeletonViewController: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	
	var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.rowHeight = 120
		tableView.estimatedRowHeight = 120
		tableView.dataSource = self
		tableView.delegate = self
        // Do any additional setup after loading the view.
		
		DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
			for _ in 0..<30 {
				self.data.append("some text")
			}
			self.tableView.reloadData()
		})
    }
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SkeletonViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		data.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
		if !data.isEmpty {
			cell.myLabel.text = data[indexPath.row]
			cell.myImageView.image = UIImage(systemName: "star")
		}
		return cell
	}
	
	
}

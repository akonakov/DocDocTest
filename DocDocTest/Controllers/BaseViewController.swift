//
//  BaseViewController.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupControls()
    }

    func setupControls() {
        errorLabel.isHidden = true
        tableView.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func showData() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.errorLabel.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.isHidden = true
            self.errorLabel.isHidden = false
            self.errorLabel.text = "\(error)"
        }
    }
    
    func startLoading () {
        errorLabel.isHidden = true
        tableView.isHidden = true
        activityIndicator.startAnimating()
    }

}

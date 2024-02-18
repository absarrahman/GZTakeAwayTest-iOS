//
//  ViewController.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit

class ContactListViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: ContactTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContactTableViewCell.identifier)
    }


}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath)
    }
    
    
}

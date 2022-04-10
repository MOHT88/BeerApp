//
//  ViewController.swift
//  BeerApp
//
//  Created by Сергей Иванов on 08.04.2022.
//

import UIKit

class ViewController: UITableViewController {

    private let beerUrl = "https://api.punkapi.com/v2/beers"
    private var beerInfo = [BeerInfo]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchBeerInfo()
    }
    
    func fetchBeerInfo() {
        NetworkManager.fetchBeerInfo(url: beerUrl) { (beerInfo) in
            self.beerInfo = beerInfo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configurationCell(cell: UITableViewCell, for indexPath: IndexPath) {
        let beerInfo = beerInfo[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = beerInfo.name
        content.secondaryText = beerInfo.description

        DispatchQueue.global().async {
            guard let imageURL = URL(string: beerInfo.image_url) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                content.image = UIImage(data: imageData)
            }
        }
    }
}


extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beerInfo.count
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beer", for: indexPath)
        configurationCell(cell: cell, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = beerInfo.name
        content.secondaryText = beerInfo.description
        return cell
    }
}
  


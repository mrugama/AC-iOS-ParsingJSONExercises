//
//  BillboardViewController.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class BillboardViewController: UIViewController {

    var dataBillboard = [Billboard]()
    
    @IBOutlet weak var billboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billboardTableView.delegate = self
        self.billboardTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "billboard", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                self.dataBillboard = Billboard.getBillboardData(from: data)
            }
        }
    }
    
}

extension BillboardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBillboard.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = dataBillboard[indexPath.row]
        let cell = billboardTableView.dequeueReusableCell(withIdentifier: "Billboard Cell", for: indexPath)
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.artistName
        return  cell
    }
}

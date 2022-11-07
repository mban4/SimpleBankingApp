//
//  ViewController.swift
//  TableView
//
//  Created by ntubic on 04.11.2022..
//

import UIKit

class SecondScreen: UIViewController {
    
    var result: Results?
    var acount = [Acount] ()
    var transaction = [Transaction]()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        setTableView()
    }
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = .magenta
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func parseJson(){
        guard let path = Bundle.main.path(forResource: "Zadatak_1", ofType: "json") else { return }
        
        let url = URL(filePath: path)
        do{
            let jsonData = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed)
//            print(jsonObject)
            result = try JSONDecoder().decode(Results.self, from: jsonData)
            self.acount = result!.acounts
            let result = result
//                print(result)
            return
        }catch{
            print("Error \(error)")
        }
    }

}

extension SecondScreen: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return acount.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return result?.acounts[section].iban
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result{
            return result.acounts[section].transactions.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError("Unable to create cell")}
        cell.dateLabel.text = acount[indexPath.section].transactions[indexPath.row].date
        cell.descriptionLabel.text = acount[indexPath.section].transactions[indexPath.row].description
        cell.amountLabel.text = acount[indexPath.section].transactions[indexPath.row].amount
        cell.typeLabel.text = acount[indexPath.section].transactions[indexPath.row].type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

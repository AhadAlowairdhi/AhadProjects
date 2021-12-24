//
//  ViewController.swift
//  Star Wars API
//
//  Created by admin on 23/12/2021.
//

import UIKit

class CharecterTableViewController: UITableViewController {

    var infoCharecter : ResultCharecter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callCharecterApi()
    }
    
// table view section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infoCharecter?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharecterCell
        cell.nameLabel.text = self.infoCharecter?.results[indexPath.row].name
        cell.genderLabel.text = self.infoCharecter?.results[indexPath.row].gender
        cell.birthLabel.text = self.infoCharecter?.results[indexPath.row].birth_year
        cell.massLabel.text = self.infoCharecter?.results[indexPath.row].mass
        return cell
    }
// function section -> call api
    func callCharecterApi() {
        let apiUrl = "https://swapi.py4e.com/api/people/"
        GetApiManager.getApiResponse(urlPath: apiUrl) {data, error in
            if error != nil {
                print("Error \(String(describing: error?.localizedDescription))")

            }else {
                if let data = data {
                    let parseCharecter = self.parseLogic(data: data)
                    self.infoCharecter = parseCharecter
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func parseLogic(data : Data) -> ResultCharecter? {
        do {
            let charecter = try JSONDecoder().decode(ResultCharecter.self , from: data)
            print(charecter.results.first!.name)
            return charecter
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}


//
//  FilmsTableViewController.swift
//  Star Wars API
//
//  Created by admin on 24/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    var infoFilm : ResultFilm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callFilmsApi()
    }

    
// table view section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.infoFilm?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCell", for: indexPath) as! FilmsCell
        cell.titleLabel.text = self.infoFilm?.results[indexPath.row].title
        cell.releaseLabel.text = self.infoFilm?.results[indexPath.row].release_date
        cell.directorLabel.text = self.infoFilm?.results[indexPath.row].director
        cell.crawlLabel.text = self.infoFilm?.results[indexPath.row].opening_crawl
        return cell
    }

// function section -> call api
        func callFilmsApi() {
            let apiUrl = "https://swapi.dev/api/films/"
            GetApiManager.getApiResponse(urlPath: apiUrl) {data, error in
                if error != nil {
                    print("Error \(String(describing: error?.localizedDescription))")

                }else {
                    if let data = data {
                        let parseFilm = self.parseLogic(data: data)
                        self.infoFilm = parseFilm
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
        private func parseLogic(data : Data) -> ResultFilm? {
            do {
                let film = try JSONDecoder().decode(ResultFilm.self , from: data)
                print(film.results.first!.title)
                return film
            }catch {
                print(error.localizedDescription)
                return nil
            }
        }

}

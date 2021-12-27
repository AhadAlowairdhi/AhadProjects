//
//  ViewController.swift
//  Bucket List API Ahad
//
//  Created by admin on 27/12/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPhotos()
    }

    //MARK: - GET Api
        func getPhotos() {
            let photoURL = "https://jsonplaceholder.typicode.com/photos"
            
            AF.request(photoURL).responseDecodable(of: [Photo].self) { response in
                guard let photoArr = response.value else { return }
                
                self.movies = photoArr.map{ photoObj in
                    print("convert photo object to string")
                    return "title: " + photoObj.title
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
}


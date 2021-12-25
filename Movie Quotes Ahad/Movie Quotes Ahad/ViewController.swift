//
//  ViewController.swift
//  Movie Quotes Ahad
//
//  Created by admin on 21/12/2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
   
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var movieNames = ["Raya", "Jungle Cruise", "Black Widow", "Tle Last Airbender", "Violet Evergarden", "Mulan", "THe Martian", "The Transporter", "The maze runner"]
    var movieLinks = [URL(string: "https://lumiere-a.akamaihd.net/v1/images/p_rayaandthelastdragon_21294_83346778.jpeg"),URL(string: "https://lumiere-a.akamaihd.net/v1/images/p_junglecruise_21740_v2_bb7f0ae4.jpeg"),URL(string: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6474/6474327_so.jpg"), URL(string: "https://m.media-amazon.com/images/I/81WmTJU0i4L._SL1500_.jpg"), URL(string: "https://m.media-amazon.com/images/M/MV5BZjljM2M1ZTgtZGM4My00OGRkLTliMjAtYzJiZDBkMzQ5ZDkzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg"), URL(string: "https://upload.wikimedia.org/wikipedia/en/1/17/Mulan_%282020_film%29_poster.jpg"), URL(string: "https://images.moviesanywhere.com/8a6c7063706170a974f9a6114a791291/22391cac-2740-4196-9af6-bc0b45d45885.jpg"), URL(string: "https://images.saymedia-content.com/.image/t_share/MTc0Mzk3OTYyODI5NDQwMzYw/should-i-watch-the-transporter.jpg"), URL(string: "https://flxt.tmsimg.com/assets/p10172717_p_v8_ad.jpg")]
    
    var quotes = ["Raya: The world's broken. You can't trust anyone. Sisu: Maybe it's broken because you don't trust anyone.", "It's only a Scam, If you fall for it.", "I'm Not The Killer That Little Girls Call Their Hero.", "Life happens wherever you are, whether you make it or not.", "I will run as fast as I can to wherever my customer desires. I am the Auto Memories Doll, Violet Evergarden.", "Loyal, Brave, and Truth.", "Every time something goes wrong, the world forgets why we fly.", "Have a good life. What's left of it.", "Leave one wolf alive and the sheep are never safe."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
}

extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieNameLabel.text = movieNames[indexPath.row]
        cell.movieImageView.kf.setImage(with: movieLinks[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "The Quote of \(movieNames[indexPath.row])", message: "\(quotes[indexPath.row])", preferredStyle: .alert)
        let back = UIAlertAction(title: "OK", style: .default, handler: nil )
        alert.addAction(back)
        present(alert, animated: true, completion: nil)
    }
    
   
}

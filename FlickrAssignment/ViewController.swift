//
//  ViewController.swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    

   
    var networkManager : flickrNetworkClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        //networkManager(ViewController: self)
        networkManager = flickrNetworkClass(viewController: self)
        

        networkManager.getImage()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkManager.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let flickrCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickrCell", for: indexPath) as! FlickrViewCell
        let user = networkManager.data[indexPath.row]
        
        let farmValue = user.farm
        let server = user.server
        let id = user.id
        let secretValue = user.secret
        
        let imageReturnedURL = "https://farm\(farmValue).staticflickr.com/\(server)/\(id)_\(secretValue)_m.jpg"
        
        flickrCell.flickrImage.downLoadImage(owner: imageReturnedURL)

        //https://farm2.staticflickr.com/1704/25180682049_0c83b86b32_m.jpg

        
        return flickrCell
    }
    
    
    
    
}

protocol Result: AnyObject{
    
    func getFinalResult()
}

extension ViewController: Result{
    
    func getFinalResult() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
    }
}

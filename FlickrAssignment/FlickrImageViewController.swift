//
//  ViewController.swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import UIKit

class FlickrViewController: UIViewController {

   // @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Declare variabel type viewmodel
    var flickrViewModel: FlickrViewModel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
           collectionView.dataSource = self
           
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        
           //Initialize viewmodel variable, Allocate memory for dlegate
           flickrViewModel = FlickrViewModel(delegate: self)
           flickrViewModel.delegate = self
           flickrViewModel.getImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension FlickrViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flickrViewModel.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let flickrCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlickrCell", for: indexPath) as! FlickrViewCell
        let user = flickrViewModel.data[indexPath.row]

        let farmValue = user.farm
        let server = user.server
        let id = user.id
        let secretValue = user.secret

        let imageReturnedURL = "https://farm\(farmValue).staticflickr.com/\(server)/\(id)_\(secretValue)_m.jpg"

        flickrCell.flickrImage.downLoadImage(owner: imageReturnedURL)

//  //      //https://farm2.staticflickr.com/1704/25180682049_0c83b86b32_m.jpg

        
        return flickrCell
    }
    
}

//Protocol->To declare view model delagate variable
protocol Result: AnyObject{

    func getFinalResult()
}

//Satisfy the above protocl
extension FlickrViewController: Result{

    func getFinalResult() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()

        }
    }
}

extension FlickrViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }


}



//
//  FlickrViewModel.swift
//  FlickrAssignment
//
//  Created by Admin on 13/03/2022.
//

import Foundation

//Protocol->To declare network manager delagate variable
protocol FlickrViewModelType: AnyObject {
    func updateImageResponce(responce: Pictures)
}

//satisfy above protocol
class FlickrViewModel: FlickrViewModelType {
    
    //To pass data we using delegate pattern, declare and initialize deleagate of type view controller protocol
    weak var delegate: Result?
    init(delegate: Result){
        self.delegate = delegate
    }
    
    //create network manager class object
    let networkManager = flickrNetworkClass()
    var data: [Photo] = []
    
    func getImage() {
        //allocate memory for NWM delegate
        networkManager.delegateFlickrViewModel = self
        networkManager.getImage()
        }
    
    func updateImageResponce(responce: Pictures) {
        //Append data from network manager class
              self.data = responce.photos.photo
        //call viewcontroller method through delegate
                DispatchQueue.main.async {
                    self.delegate?.getFinalResult()
    }

}
}

//
//  FlickrViewModel.swift
//  FlickrAssignment
//
//  Created by admin on 15/03/2022.
//

import Foundation

protocol FlickrModelType: AnyObject {
    func updateImageResponce(responce: Pictures)
}

class FlickrViewModel: FlickrModelType {
    weak var delegate: Result?
    var networkManager: flickrNetwork = NetworkManager()
    init(delegate: Result){
        self.delegate = delegate
    }
    
    
    //let networkManager = flickrNetworkClass()
    var data: [Photo] = []
    
    func getImage(search: String) {
        networkManager.delegateViewModel = self
        networkManager.getImage(search: search)
        }
    
    func updateImageResponce(responce: Pictures) {
    
              self.data = responce.photos.photo
    
                DispatchQueue.main.async {
                    self.delegate?.getFinalResult()
    }

}
}

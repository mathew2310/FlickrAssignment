//
//  NetworkManager .swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import Foundation


protocol flickrNetwork {
    
    func getImage()
}

class flickrNetworkClass: flickrNetwork {    
    
    //create delegate varaible so we can call method in view model
    weak var delegateFlickrViewModel : FlickrViewModelType?
    var data: [Photo] = []
    func getImage() {
        
        
        let urlstr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=cat&format=json&nojsoncallback=1"
        
       // let urlString = URL(string: urlstr)
        guard let url = URL(string: urlstr) else {return}
        let session = URLSession.shared
        let datatask = session.dataTask(with: url) {
            data, responce, error in
            
            guard let data = data else {
                           print("Empty data")
                           return
                       }

            
            let decoded = JSONDecoder()
            do{

                let decodedResponce = try decoded.decode(Pictures.self, from: data)
                self.data = decodedResponce.photos.photo
               print("data")
                //with delegate variable call and send data to view model
                self.delegateFlickrViewModel?.updateImageResponce(responce: decodedResponce)

            
            }catch{
                print(error.localizedDescription)
            }
            
        }
        datatask.resume()
    }

    }
    
    
    


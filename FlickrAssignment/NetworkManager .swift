//
//  NetworkManager .swift
//  FlickrAssignment
//
//  Created by admin on 11/03/2022.
//

import Foundation


protocol flickrNetwork {
    var delegateViewModel: FlickrModelType? {get set}
    func getImage(search: String)
}

class NetworkManager: flickrNetwork {
    
    weak var delegateViewModel: FlickrModelType?
    var data: [Photo] = []
    
    func getImage(search: String) {
        
        let urlstr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=0e08e76eff544231b992197c7c7c22a9&text=\(search)&format=json&nojsoncallback=1"
        
        let url = URL(string: urlstr)
        
        guard url != nil else  {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {
            data, responce, error in
            guard let data = data else {
                return
            }

            let decoded = JSONDecoder()
            do{
                //let decodedResponce = try
                //JSONDecoder().decode(UserResponce.self, from: data!)
                let decodedResponce = try decoded.decode(Pictures.self, from: data)
                self.data = decodedResponce.photos.photo
               
                
                self.delegateViewModel?.updateImageResponce(responce: decodedResponce)
            
            }catch{
                print(error.localizedDescription)
            }
            
        }
        datatask.resume()
    }

    }
    
    
    


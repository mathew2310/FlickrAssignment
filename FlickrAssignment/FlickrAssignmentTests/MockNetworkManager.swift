//
//  MockNetworkManager.swift
//  FlickrAssignmentTests
//
//  Created by admin on 17/03/2022.
//

import XCTest
@testable import FlickrAssignment


    class MockNetworkManager: flickrNetwork {
        
        weak var delegateViewModel: FlickrModelType?


        func getImage(search: String) {
            let bundle = Bundle(for: MockNetworkManager.self)
            
            guard let url =  bundle.url(forResource: "Photographer", withExtension:".json") else  {
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoded = JSONDecoder()
                do{
                    let decodedResponce = try decoded.decode(Pictures.self, from: data)

                    self.delegateViewModel?.updateImageResponce(responce: decodedResponce)

                }catch{
                    print(error.localizedDescription)

                }
            }catch {
                
            }
           
        }

    }
    

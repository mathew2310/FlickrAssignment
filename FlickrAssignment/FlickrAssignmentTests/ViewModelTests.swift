//
//  ViewModelTests.swift
//  FlickrAssignmentTests
//
//  Created by admin on 17/03/2022.
//

import XCTest
@testable import FlickrAssignment


class ViewModelTests: XCTestCase {

    var mockNetwork: MockNetworkManager!
    var viewModel: FlickrViewModel!
    
    override func setUpWithError() throws {
        let controller =  ViewController()
        viewModel = FlickrViewModel(delegate: controller)
       mockNetwork = MockNetworkManager()
        viewModel.networkManager = mockNetwork

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetImages() {
        
        // GIVEN
        
         let searchText = "dog"
        
        
        // When
        
        XCTAssertEqual(viewModel.data.count, 0)

        viewModel.getImage(search: searchText)
        
        // Then
        
        XCTAssertEqual(viewModel.data.count, 99)
        
        
       XCTAssertEqual(viewModel.data[0].title, "abcd")
        
    }
}

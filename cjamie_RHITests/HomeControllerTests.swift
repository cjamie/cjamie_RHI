//
//  HomeControllerTests.swift
//  second_cjamie_RHITests
//
//  Created by Jamie Chu on 9/14/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import XCTest
@testable import cjamie_RHI
import RHI_Network
class HomeControllerTests: XCTestCase {


    func makeSUT() -> (HomeController, HomeControllerCoordinationDelegate) {
        let controller = HomeController(
            viewModel: .init(
                recordsfetcher: RemoteItunesAPI()
            )
        )
        _ = controller.view
        let spy: HomeControllerCoordinationDelegate = CoordinatorDelegateSpy()
        return (controller, spy)
    }
    
    
    private class CoordinatorDelegateSpy: HomeControllerCoordinationDelegate {
        
        private(set) var capturedViewModels: [AlbumInfoViewModel] = []
        private(set) var capturedErrors: [Error] = []

        func homeController(_ controller: HomeController, didSelectViewModel viewModel: AlbumInfoViewModel) {
            capturedViewModels.append(viewModel)
        }
        
        func homeController(_ controller: HomeController, fetchingDidFailWith error: Error) {
            capturedErrors.append(error)
        }
    }
}

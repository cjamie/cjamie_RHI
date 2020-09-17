//
//  AppCoordinatorTests.swift
//  second_cjamie_RHITests
//
//  Created by Jamie Chu on 9/15/20.
//  Copyright © 2020 Jamie Chu. All rights reserved.
//

import XCTest
@testable import cjamie_RHI

class AppCoordinatorTests: XCTestCase {

    func test_init_hasEmptyCollectionAsChildren() {
        // GIVEN, WHEN
        let sut = makeSUT()
        
        // THEN
        XCTAssert(sut.children.isEmpty)
    }
    
    func test_start_setsWindowsRootViewController_withNavigationController_fromCoordinator() {
        // GIVEN
        let providedWindow = UIWindow()
        let sut = makeSUT(myWindow: providedWindow)
        let expected = sut.navigationController
        
        // WHEN
        sut.start()
        
        guard let actual = providedWindow.rootViewController else {
            XCTFail()
            return
        }

        // THEN
        XCTAssert(expected === actual)
        
    }
    
    // MARK: - Helpers
    
    private func makeSUT(myWindow: UIWindow = .init()) -> Coordinator {
        return AppCoordinator(navigationController: .init(), window: myWindow)
    }
}

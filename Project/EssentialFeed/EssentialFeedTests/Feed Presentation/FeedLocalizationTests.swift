//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//  
//  Created by Patrick Domingo on 8/8/22
//

import XCTest
import EssentialFeed

final class FeedLocalizationTestes: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}

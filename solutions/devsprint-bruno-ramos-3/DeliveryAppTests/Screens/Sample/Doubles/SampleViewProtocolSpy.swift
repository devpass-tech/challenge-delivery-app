//
//  SampleViewProtocolSpy.swift
//  DeliveryAppTests
//
//  Created by Bruno Henrique Costa Ramos on 15/02/22.
//

import UIKit
@testable import DeliveryApp

final class SampleViewProtocolSpy: UIView, SampleViewProtocol {
    var delegate: SampleViewDelegate?

    private(set) var displayCalled = false
    private(set) var displayCalledCount = 0
    func display(viewModel: [SampleView.ViewModel]) {
        displayCalled = true
        displayCalledCount += 1
    }
}

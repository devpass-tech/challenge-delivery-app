import Foundation
import XCTest

@testable import DeliveryApp

final class SampleViewControllerTests: XCTestCase {
    private let viewSpy = SampleViewProtocolSpy()
    private let serviceSpy = SampleServiceProtocolSpy()

    private lazy var sut = SampleViewController(
        customView: viewSpy,
        service: serviceSpy
    )

    func test_didTapOnSomeButton_givenSuccess_shouldCallViewDisplay() {
        // Given, Arrange
        let randomString = "Foo"
        serviceSpy.fetchSomeDataToBeExecuted = .success([randomString])

        // When, Act
        sut.didTapOnSomeButton()

        // Then, Assert
        XCTAssertTrue(serviceSpy.fetchSomeDataCalled)
        XCTAssertTrue(viewSpy.displayCalled)
        XCTAssertEqual(viewSpy.displayCalledCount, 1)
    }

    func test_didTapOnSomeButton_givenFailure_shouldNotCallViewDisplay() {
        // Given, Arrange
        serviceSpy.fetchSomeDataToBeExecuted = .failure(ErrorDummy())

        // When, Act
        sut.didTapOnSomeButton()

        // Then, Assert
        XCTAssertTrue(serviceSpy.fetchSomeDataCalled)
        XCTAssertFalse(viewSpy.displayCalled)
        XCTAssertEqual(viewSpy.displayCalledCount, 0)
    }
}

struct ErrorDummy: Error {}

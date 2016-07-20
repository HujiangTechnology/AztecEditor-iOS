import XCTest
@testable import Aztec
import libxml2

class OutAttributeConverterTests: XCTestCase {

    typealias HTML = Libxml2.HTML
    typealias Attribute = HTML.Attribute
    typealias StringAttribute = HTML.StringAttribute

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /// Tests a simple HTML.Attribute to xmlAttribute conversion
    ///
    func testSimpleConversion() {
        
        let name = "Attribute"
        let testAttribute = Attribute(name: name)
        let xmlAttribute = Libxml2.Out.AttributeConverter().convert(testAttribute)
        
        let xmlAttributeNameText = String(CString: UnsafePointer<Int8>(xmlAttribute.name), encoding: NSUTF8StringEncoding)
        
        XCTAssertEqual(name, xmlAttributeNameText)
    }
}
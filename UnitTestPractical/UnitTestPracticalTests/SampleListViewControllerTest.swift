import Quick
import Nimble
@testable import UnitTestPractical

class SampleListViewControllerTest: QuickSpec {
    override func spec() {
        var viewController: SampleListViewController!
        var repository: SampleRepository!
        
        beforeEach {
            repository = SampleRepository()
            viewController = SampleListViewController.createVC(repository)
        }
        
        describe("viewDidLoad") {
            beforeEach {
                let _ =  viewController.view
                    viewController.viewWillAppear(true)
            }
            it("RxDataSource Table rows") {
                let firstCell = viewController.dataSource.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? SampleItemCell
                expect(firstCell?.titleView.text).toEventually(equal("aaa"))
            }
        }
    }
}


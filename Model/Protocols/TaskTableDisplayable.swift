import Foundation
import UIKit

protocol TaskTableDisplayable {
	
	func createTaskExtensionView(frame: CGRect) -> TaskTableViewCellContent?
	
	func getTaskExtensionHeight() -> CGFloat
	
}

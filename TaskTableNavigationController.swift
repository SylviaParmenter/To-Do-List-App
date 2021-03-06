
import UIKit

class TaskTableNavigationController: UINavigationController, ThemeDelegate {

	//MARK: Properties
	var addButton: UIButton!
	var sideMenu: SideMenu!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		updateAppearance()
		setupSideMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// Called on Theme change
	func updateAppearance() {
		self.navigationBar.barTintColor = Theme.navigationBarTintColor
	}
	
	private func setupSideMenu() {
		sideMenu = SideMenu(superview: view)
		let frameTemp = CGRect(x: view.frame.maxX + 5, // +5 for shadow
			y: view.frame.height - (UIScreen.main.nativeBounds.height == 2436 ? 220 : 190),
						   width: 150,
						   height: 60)
		
		let addFrame = CGRect(x: frameTemp.minX, y: frameTemp.minY, width: frameTemp.width, height: frameTemp.height)
		let addButton = SideMenuButton(frame: addFrame, title: NSAttributedString(string: "  +", attributes: [NSAttributedStringKey.font: UIFont(name: "Times", size: 45)!]), image: nil, color: Utils.getTaskCellColor(priority: Task.PRIORITY_MIN)) { (sender) in
			guard let taskTable = self.viewControllers.first as? TaskTableViewController else {
				return
			}
			taskTable.newTask()
		}
		sideMenu.addButton(button: addButton, alwaysOn: true)
		
		let settingsFrame = CGRect(x: frameTemp.minX, y: frameTemp.minY - 80, width: frameTemp.width, height: frameTemp.height)
		let settingsButton = SideMenuButton(frame: settingsFrame, title: nil, image: UIImage(named: "SettingsIcon"), color: Utils.getTaskCellColor(priority: Task.PRIORITY_MIN + 20)) { (sender) in
			if !(self.topViewController is SettingsTableViewController) {
				self.sideMenu.hide(hideStatic: true)
				self.performSegue(withIdentifier: "TaskTableToSettings", sender: nil)
			}
		}
		sideMenu.addButton(button: settingsButton, alwaysOn: false)
		
		let feedbackFrame = CGRect(x: frameTemp.minX, y: frameTemp.minY - 160, width: frameTemp.width, height: frameTemp.height)
		let feedbackButton = SideMenuButton(frame: feedbackFrame, title: nil, image: UIImage(named: "ChatBubble"), color: Utils.getTaskCellColor(priority: Task.PRIORITY_MIN + 40)) { (sender) in
			if !(self.topViewController is FeedbackViewController) {
				self.sideMenu.hide(hideStatic: true)
				self.performSegue(withIdentifier: "TaskTableToFeedback", sender: nil)
			}
		}
		sideMenu.addButton(button: feedbackButton, alwaysOn: false)
		
		let priPolFrame = CGRect(x: frameTemp.minX, y: frameTemp.minY - 240, width: frameTemp.width, height: frameTemp.height)
		let priPolButton = SideMenuButton(frame: priPolFrame, title: nil, image: UIImage(named: "PrivacyIcon"), color: Utils.getTaskCellColor(priority: Task.PRIORITY_MIN + 60)) { (sender) in
			if !(self.topViewController is PrivacyPolicyViewController) {
				self.sideMenu.hide(hideStatic: true)
				self.performSegue(withIdentifier: "TaskTableToPrivacyPolicy", sender: self)
			}
		}
        /*let priPolButton = SideMenuButton(frame: priPolFrame, title: NSAttributedString(string: "  !", attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 45)!]), image: nil, color: Utils.getTaskCellColor(priority: Task.PRIORITY_MIN + 60)) { (sender) in
         if !(self.topViewController is PrivacyPolicyViewController) {
         self.sideMenu.hide(hideStatic: true)
         self.performSegue(withIdentifier: "TaskTableToPrivacyPolicy", sender: self)
         }
         }*/
		sideMenu.addButton(button: priPolButton, alwaysOn: false)
	}

}

//
//  ViewController.swift
//  ServiceNotification
//
//  Created by Юрий Девятаев on 04.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var nfManager: UseNotification = NotificationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .cyan
        requestAuthorizationNotification()
    }
    
    @IBAction func actionCreateNotification(_ sender: UIButton) {
        self.createReminder()
    }
    
    func requestAuthorizationNotification(){
        nfManager.requestAuthorization {_ in}
    }
    
    func createReminder(){
        let timeInterval: Double = 5
        let remainder = Reminder(timeInterval: timeInterval,
                                 date: nil,
                                 location: nil,
                                 type: .time,
                                 repeats: false)
        let notification = CustomNotification(title: "TitleNot",
                                          subTitle: "SubTitleNot",
                                          body: "BodyNot",
                                          complete: false,
                                          reminderEnabled: true,
                                          reminder: remainder)
        
        nfManager.sheduleNotification(notification: notification)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.nfManager.removeNotification(id: notification.id)
//            self.nfManager.removeAllPendingNotifications()
        }
    }
}


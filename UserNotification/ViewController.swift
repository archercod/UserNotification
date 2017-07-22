//
//  ViewController.swift
//  UserNotification
//
//  Created by Marcin Pietrzak on 22.07.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scheduleNotification()
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Simple Notification"
        content.subtitle = "Never ending learning"
        content.body = "Simple Notification - Alert is Ready"
        content.badge = 1
        content.sound = UNNotificationSound.default()
        content.userInfo = ["id":42]
        
        /*
        //Add image to Notification
        let imageURL = Bundle.main.url(forResource: "sample", withExtension: "jpg")
        let attachment = UNNotificationAttachment(identifier: "sample.jpg", url: imageURL!, options: nil)
         content.attachments = [attachment]
        */
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0,
                                                        repeats: false)
        
        let request = UNNotificationRequest(identifier: "simple.notification",
                                            content: content,
                                            trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        notificationCenter.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

    extension ViewController: UNUserNotificationCenterDelegate {
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            print(response.notification.request.content.userInfo)
            completionHandler()
        }
        
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert, .sound])
        }
    }




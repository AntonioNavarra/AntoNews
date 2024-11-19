//
//  AntoNewsApp.swift
//  AntoNews
//
//  Created by Antonio Navarra on 12/11/24.
//

import SwiftUI
import UserNotifications
import UIKit

@main
struct AntoNewsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TopicsView()
                .onAppear {
                    NotificationManager.shared.requestPermission()
                    
                    let latestTitle = "Chelsea have condemned homophobic abuse"
                    let latestBody = "The 31-year-old Australia captain, who has missed the majority of this ..."

                    NotificationManager.shared.scheduleDailyNotification(
                        title: latestTitle,
                        body: latestBody
                    )
                }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let center = UNUserNotificationCenter.current()
        center.delegate = self 
        return true
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            let detailNewsView = DetailNewsView()
            let hostingController = UIHostingController(rootView: detailNewsView)

            window.rootViewController = hostingController
            window.makeKeyAndVisible()
        }

        completionHandler()
    }

}

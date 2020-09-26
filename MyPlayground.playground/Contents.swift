import UIKit
import Foundation
import Combine

var str = "Hello, playground"
var subscriptions = Set<AnyCancellable>()


example(of: "publisher"){
    let notification = Notification.Name("MyNotification")
    let publisher  = NotificationCenter.default.publisher(for: notification, object: nil)
    
    
    let subscription = publisher
        .sink { _ in
            print("Notification recived from a publisher!")
        }
    
    
    let center =  NotificationCenter.default
    let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
        print("Notications Reciced")
    }
    center.post(name: notification, object: nil)
    center.removeObserver(observer)
    
//    print(publisher)
}


public func example(of description: String, action:()-> Void) {
    print("Example of:", description,"---------")
    action()
}

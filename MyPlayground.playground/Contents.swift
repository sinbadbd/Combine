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
    subscription.cancel()
    
    let center =  NotificationCenter.default
    let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
        print("Notications Reciced")
    }
    center.post(name: notification, object: nil)
    center.removeObserver(observer)
    
    //    print(publisher)
}




// 2

example(of:"Just"){
    // 1
    let just = Just("Hellow world")
    
    //2
    _ = just
        .sink(
            receiveCompletion: {
                print("Recived completion: ", $0)
            },
            receiveValue: {
                print("Recived Value: ", $0)
            })
}



// KVO: ( Key value observing )

example(of: "assign(to:on:)"){

 
    //1
    class SomeObject  {
        var value : String = "" {
            didSet{
                print(value)
            }
        }
    }
    //2
    
    let object = SomeObject()
    
    let publisher = ["Hello", "World!", "Bangladesh", "iOS", "Android"].publisher
    
    _ = publisher.assign(to: \.value, on: object)
    
}







public func example(of description: String, action:()-> Void) {
    print("Example of:", description,"---------")
    action()
}

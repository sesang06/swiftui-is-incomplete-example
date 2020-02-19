# swiftui-is-incomplete-example
after developing only with swiftui, I found it is not appropriate for actual project yet :(

# WHY SWIFTUI IS NOT GOOD NOW?

## too weak accessors for detailed UI
When making chating app, you would often use UITableView. You may utilize notificationCenter to observe keyboard height.
And Accessing UITableView's `contentInset`, `scrollindicatorinsets` accessor to adjust keyboard.
How about SWIFTUI? You have no way to access this property with your List. :(

When After submitting your text, you may want to automattically scroll down to bottom. 
How about SWIFTUI? You would hard time to implement this.

It's quite troublesome :(

So I decided not to use SwiftUI, abandoning the code and re-implementing it into UIKIt ONE.

For Just Now, SwiftUI may not good option for detailed ui actions, Be careful!


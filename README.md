# UrSquad

SwiftUI super heroes squad app based on Marvel API: https://developer.marvel.com

The folowed approach:

The architectural approach for the assignment is based on Clean Architecture with SwiftUI-MVVM-Repository. Clean Architecture offers decoupling between the Presentation-Domain-Data Access layers. In the current approach, no intermediate Service/UseCase was used for the ViewModel-Repository communication. Although, for larger projects with multiple screens and ViewModels, where business logic has to be reused, the use of a UseCase would be probably necessary.

SwiftUI was chosen over UIKit because of its declarative, clean syntax that reduces boilerplate code and fasts up the development process. The whole assignment would have implemented with way more boilerplate code and effort with UIKit. Especially the List/VStack part that is way easy to use in SwiftUI with just a couple lines of code. Also, SwiftUI is backed with Combine, and in addition with the @Published properties of the Observed ViewModel, we have an out-of-the-box reactive ecosystem that offers a very flexible and responsive UI. 

The ViewModel communicates with HeroWebRepository in order to retrieve the data from Marvel API. This communication happens with Apple’s latest concurrency API, async/await. Async/await provides a very clean way to perform asynchronous calls, as if they were synchronous. The result is an easy to read code, and easy to debug, since we can avoid all the wirings with oldest, closure-based implementations. Also, the testing becomes very easy because we avoid the fulfilment of expectations and happens in a linear way.

For local persistence, the ViewModel communicates with HeroLocalRepository, which basically is a wrapper for FileManager. FileManager offers a thread-safe, easy to use API that allows to store large objects to disk. Although there is a performance cost in its use, if we want to store/retrieve a very large set of data. For that purpose, an SQLite database would be a good choice. 

For Dependency Injection, the Container-based Factory paradigm has been used. This approach is adaptable, it supports containers and scopes that let us control a dependency’s lifetime, requires minimum setup for dependency registration, and also is compile-time safe, since a factory for a given type must exist or the code simply will not compile. Last, it provides great flexibility in unit testing, as it makes it easy to reach into a chain of dependencies and make specific changes to the system as needed.

For the UI part, Kingfisher was used for getting the remote hero images from the provided url. Kingfisher was also very easy to use. We just provide a url and it creates the View with your image. That simple. The ScrollKit package was also used in order to provide this very smooth and delicate stretching effect in the hero image in HeroDetails screen.

For the Unit testing part, the ViewModel’s interaction with both HeroLocalRepository and HeroWebRepository has been tested.  Also, the Integration testing for the HeroWebRepository was provided in order to test its behaviour as a gateway to outside systems.

For the UI testing, Snapshot testing has been used, In the first place, it’s very easy to write with just a couple of lines of code for each test case. Also, it gives us the possibility to isolate each view to its own test case and achieve loose coupling between them. The snapshots were captured on an iPhone 14 Pro Max simulator. 

Last, a SwiftFormater was used in order to provide an evenly formatted codebase. For that purpose, the default configuration rules were used . 

# AC-iOS-ParsingJSONExercises

## Organizing Structure

- Create a Tab Bar Controller.  
- Each Tab in the Tab Bar Controller should be a Navigation Controller
- The Navigation Controller should have a View Controller with a Table View as its Root View Controller
- Selecting a cell in the Table View should segue to a Detail View Controller with additional information.

## Parsing Data

- Below are the endpoints to hit.  For each endpoint, select a search query and copy and paste the JSON into Xcode.  Make a new file called customname.json and save it at the top level of your project.


In order to access your json and convert it to type Data, use the code below:

```swift
if let path = Bundle.main.path(forResource: "nameHere", ofType: "json") {
    let myURL = URL(fileURLWithPath: path)
    if let data = try? Data(contentsOf: myURL) {
		//USE Data HERE
    }
}
```

- Create a model for each Data Set

```swift
class ThingOne {
	var propOne: Int
	var propTwo: [String]
	init(propOne: Int, propTwo: [String]) {
		self.propOne = propOne
		self.propTwo = propTwo
	}
}
```

- Create a convenience initializer that takes in something jsonlike as input:
- Note: If you don't find the property at that key, you can either:

1. return nil in which case no object gets created
2. set that property to some default value


```swift
class ThingOne {
	var propOne: Int
	var propTwo: [String]
	init(propOne: Int, propTwo: [String]) {
		self.propOne = propOne
		self.propTwo = propTwo
	}
	convenience init?(from jsonDict: [String: Any]) {
		let propOne: Int = jsonDict["propOne"] as? Int else {return nil}
		let propTwo: [String] = jsonDict["propTwo"] as? [String] ?? []
		self.init(propOne: propOne, propTwo: propTwo)
	}
}

```

- Create a class function that takes Data? as input and returns an array of Swift objects

```swift
class ThingOne {
	var propOne: Int
	var propTwo: [String]
	init(propOne: Int, propTwo: [String]) {
		self.propOne = propOne
		self.propTwo = propTwo
	}
	convenience init?(from jsonDict: [String: Any]) {
		let propOne = jsonDict["propOne"] as? Int else {return nil}
		let propTwo = jsonDict["propTwo"] as? [String] ?? ""
		self.init(propOne: propOne, propTwo: propTwo)
	}

	class func getThings(from data: Data?) -> [ThingOne] {
		//Parse the data here
		return []
	}
}
```
- In your View Controller, load data by calling the class function above.


## Exercises

Hit each of the following endpoints and create a new tab with a Table View and Detail View Controller

1. [Billboard Song API](http://billboard.modulo.site/search/song?q=YOURTERMHERE) (Change "YOURTERMHERE" to a search term of your choice)
2. [Open Weather API](https://openweathermap.org/current) (Use "Cities within a rectangle zone")
3. [The Color API](http://www.thecolorapi.com/docs) (Use "Schemes")
4. [NewsAPI](https://newsapi.org/) (Register for an API Key and select a news source other than the example)

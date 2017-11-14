# AC-iOS-ParsingJSONExercises

## Organizing Structure

- Create a Tab Bar Controller.  
- Each Tab in the Tab Bar Controller should be a Navigation Controller
- The Navigation Controller should have a View Controller with a Table View as its Root View Controller
- Selecting a cell in the Table View should segue to a Detail View Controller with additional information.

## Parsing Data

- Below are the endpoints to hit.  For each endpoint, select a search query and copy and paste the JSON into Xcode using the following format:

```swift
class RawData {
	static let thingOneData: Data? = 
	"""
	{json here}
	""".data(using: .utf8)
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
- Create a class function that takes Data? as input and returns an array of Swift objects

```swift
class ThingOne {
	var propOne: Int
	var propTwo: [String]
	init(propOne: Int, propTwo: [String]) {
		self.propOne = propOne
		self.propTwo = propTwo
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

1. [API of Ice and Fire](https://www.anapioficeandfire.com/api/houses)
2. [Billboard Song API](http://billboard.modulo.site/search/song?q=YOURTERMHERE) (Change "YOURTERMHERE" to a search term of your choice)
3. [Open Weather API](https://openweathermap.org/current) (Use "Cities within a rectangle zone")
4. [The Color API](http://www.thecolorapi.com/docs) (Use "Schemes")
5. [NewsAPI](https://newsapi.org/) (Register for an API Key and select a news source)

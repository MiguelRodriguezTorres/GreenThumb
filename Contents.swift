// Write your code here 🪴

// months of the year enum
enum Month {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

// Plantable protocol
protocol Plantable {
    var plantMonth: Month { get }
    var plantingInstructions: String { get }
}

// Waterable protocol
protocol Waterable {
    var inchesOfWater: Int { get }
    var wateringFrequency: String { get }
    var wateringInstructions: String { get }
}

// Harvestable protocol
protocol Harvestable {
    var harvestMonth: Month { get }
    var harvestingInstructions: String { get }
}

// Gardenable protocol
protocol Gardenable: Plantable, Waterable, Harvestable {
    func printGardeningTips()
}

// extension for Gardenable protocol with default value for printGardeningTips
extension Gardenable {
    func printGardeningTips() {
        print("Follow these Gardening 101 tips for a bountiful harvest. 1) Make sure you always water your plant the exact amount that it needs. \(harvestingInstructions). 2) Make sure you know what zone that you're planting in to ensure that the plants you're planting are in their optimal environment. 3) Make sure you plant seasonal plants in the right months. \(plantingInstructions).\n")
    }
}

// kale struct 🥬
struct Kale: Gardenable {
    // Plantable
    var plantMonth = Month.september
    var plantingInstructions = "Kale should be planted 6 to 8 weeks before the first frost in in-ground gardens, raised beds, or containers."
    
    // Waterable
    var inchesOfWater = 2
    var wateringFrequency = "weekly"
    var wateringInstructions = "Kale needs to be watered 2 inches of water weekly."
    
    // Harvestable
    var harvestMonth = Month.november
    var harvestingInstructions = "Kale should be harvested approximately 60 days after it's been planted."
}

// printTips() is generic - essentially loop through plants and print tips for each plant
func printTips<T: Gardenable>(for plants: [T]) {
    for plant in plants {
        plant.printGardeningTips()
    }
}

// tomato struct 🍅
struct Tomato: Gardenable {
    // Plantable
    var plantMonth = Month.february
    var plantingInstructions = "Tomatoes should be spaced 24 to 30 inches apart. After planting, pat the soil around the plant until firm."
    
    // Waterable
    var inchesOfWater = 1
    var wateringFrequency = "weekly"
    var wateringInstructions = "Tomatoes need to be watered daily, but back off after the first week, slowly weaning the plants down to 1 to 1.5 inches weekly."
    
    // Harvestable
    var harvestMonth = Month.august
    var harvestingInstructions = "Grasp the tomato firmly but gently and twist it off the vine."
}

// instance of Kale struct
let plants = [Kale()]
let tomatoPlants = [Tomato()]
printTips(for: plants)
printTips(for: tomatoPlants)

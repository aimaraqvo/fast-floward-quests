/*Thanks to 0xfarms for this incredible solution. I tried to understand 
the code as best I could and I dared to modify it just a bit. 
After 72 hours of studying Cadence fundamentals as crazy, 
I think I could understand most of this amazing work.*/


/*The Quest is to write a function that displays a canvas in a frame.
ex
"+-----+"
"|*   *|"
"| * * |"
"|  *  |"
"| * * |"
"|*   *|"
"+-----+"*/

//Declaring Canvas structure
pub struct Canvas {
    
    pub let width: UInt8
    pub let height: UInt8
    //Declaring pixels field like an array of string
    pub let pixels: [String]

    init(width: UInt8, height: UInt8, pixels: [String]){
        self.width = width
        self.height = height
        self.pixels = pixels
    }
}

 //Preparing the framework
 pub fun display(pixels: [String]) {
     var framework: String = "+-----+"
    log(framework)
    for i in pixels {
        //I loved this 
        log(("|").concat(i).concat("|"))
    }
    log(framework)
}

//The art work to frame
pub fun main() {
    let pixelsX = [

        "*   *",
        " * * ",
        "  *  ",
        " * * ",
        "*   *"
    ] 

//Creating Canvas structure
    let canvasX = Canvas(
        width: 5,
        height: 5,
        pixels: pixelsX
    )

    display(pixels: pixelsX)

//Another just for fun XD
    let pixelsY = [

        "@ @ @",
        " * * ",
        "  *  ",
        " * * ",
        "@ @ @"
    ]

    let canvasY = Canvas(
         width: 5,
        height: 5,
        pixels: pixelsY
    )
    
    display(pixels: pixelsY)
}







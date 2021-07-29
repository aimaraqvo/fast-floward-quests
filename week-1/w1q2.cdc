/*W1Q2 – Uniques
Create a resource that prints Picture's but only once for each
 unique 5x5 Canvas.*/

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

//declaring Picture resource
pub resource Picture {
    pub let canvas: Canvas 

    init (canvas: Canvas) {
        self.canvas = canvas
    }
}

//declaring Printer resource and creating Picture resourse inside 
pub resource Printer {

    // Map to remember which Canvases have been printed.
    pub var printed: [String]

     init() {
     self.printed = []
    }

    // If the canvas pixels have not been printed, print it as a picture.
   // Otherwise log an error.
    pub fun print(canvas: Canvas): @Picture? {
    
      if self.printed.contains(serializeStringArray(canvas.pixels)) {
		 log("Picture has been printed before")
      	 return nil
   	  }
	 self.printed.append(serializeStringArray(canvas.pixels))
	 return <- create Picture(canvas: canvas)
   }
}


pub fun serializeStringArray(_ lines: [String]): String {
    var buffer = ""
    for line in lines {
     buffer = buffer.concat(line)
    }
   return buffer
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

    //another art work 
    let pixelsP = [

        "* * *",
        "*   *",
        "* * *",
        "*    ",
        "*    "
    ] 

     //another art work 
    let canvasP = Canvas(
        width: 5,
        height: 5,
        pixels: pixelsP
    )

    //fake art work 
    let pixelsP2 = [

        "* * *",
        "*   *",
        "* * *",
        "*    ",
        "*    "
    ] 

     //fake
    let canvasP2 = Canvas(
        width: 5,
        height: 5,
        pixels: pixelsP2
    )

    //another art work 
    let pixelsR = [

        "* * *",
        "*   *",
        "* * *",
        "*  * ",
        "*   *"
    ] 

     //another art work 
    let canvasR = Canvas(
        width: 5,
        height: 5,
        pixels: pixelsR
    )

    //display(pixels: pixelsX)

   
    //creating Printer resource
   let printer <- create Printer()

  //starting to test
  log("Trying to print 1st canvas")
   if let printX <- printer.print(canvas: canvasX) {
       display(pixels: canvasX.pixels)
		log("Success!")
		destroy printX
   }

   //Testing newone
   log("Trying to print 2nd canvas")
   if let printP <- printer.print(canvas: canvasP) {
       display(pixels: canvasP.pixels)
		log("Success!")
		destroy printP
   }

    //Let's see the fake, shouldn't succeed
    log("Trying to print 3nd canvas")
   if let printP2 <- printer.print(canvas: canvasP2) {
       display(pixels: canvasP2.pixels)
		log("Success!")
		destroy printP2
   }
    
    //Testing newone again
   log("Trying to print 4th canvas")
   if let printR <- printer.print(canvas: canvasR) {
       display(pixels: canvasR.pixels)
		log("Success!")
		destroy printR
   }

   destroy printer
}
//OMG this was HARD XD


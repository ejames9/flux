//  flux.Swift
//
//  A native swift gulp.js-style Taskrunner API.
//
//  Eric Foster





import Foundation



extension InputStream {
  //Pipe method, pipes data from an input stream to a given
  //OutputStream..
  public func pipe(_ outputStream: OutputStream)-> InputStream {
    // Allocate memory for pointer...
    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1024)
    // Read stream data into buffer...
    self.read(buffer, maxLength: 1024)
    // Write buffer data into OutputStream...
    outputStream.write(buffer, maxLength: 1024)
    // Return stream
    // return self
    return self
  }
}


//Global delegate for handling stream related events..
protocol StreamDelegate {
  func stream(_ theStream: InputStream, eventCode: Stream.Event)
}
//
// var eventCode: Stream.Event! = nil

//Instance of RunLoop..
var loop = RunLoop()


//The Flo object..
public class Flux {

  var tasks: [String] = []

  private var uint8Pointer: UnsafeMutablePointer<UInt8>! = nil

  // private var delegate: StreamDelegate! = nil

  public var flow: FluxStream! = nil

  private var buffer: UnsafeMutablePointer<UInt8>! = nil


  private func initiateDataStream(filePath: String)-> FluxStream {
    var stream: FluxStream! = nil
    print("2")

    let file = File(filePath)
    print("pre")
    print(file.contents)
    print("post")
    print(file.isBottle)
    print(file.byteLength)
    print(file.url)
    print(file.path)
    // instantiate, schedule and open the stream
    stream = FluxStream()

    stream.push(file.buffer.description)
    //schedule, then open the stream
    // stream.schedule(in: RunLoop.current, forMode: RunLoopMode.commonModes)
    stream.open()
    // Set Flo member flow to stream instance
    self.flow = stream
    // Return stream..
    return stream
   }





  // private func prepareDataForStream(_ url: String) -> Data {
  //   print("shit")
  //   data = Data(contentsOfFile: url)
  //   // delegate.stream(theStream: stream, eventCode: Stream.Event.openCompleted)
  //   return data as Data
  // }

  // This is a placeholder for a flo plug-in. Plug-ins will take a Data object, convert it to string and perform some
  // kind of adjustment, alteration etc., re-append it to a Data object, and return it.
  public func fluxPipe(str: String)-> OutputStream {
    print(str)
    let fPStream = OutputStream(toFileAtPath: "./resources/file.txt", append: false)!
    return fPStream
  }

  public func to(glob filePath: String) {

  }

  // Will take a stream object, convert it to a Data object, and open the next plugin with the
  // Data object as it's parameter. When the plug-in returns it's Data object, the pipe will return
  // the object to a stream, and return a Flo instance to enable chainability.
  // public func pipe(_ stream: InputStream) {
  //   // fn()
  //   print("shit")

    //get initialized pointer and size for buffer
    // let bufferSize = 1024
    // let buffer = getUnsafeMutablePointer()
    //
    // var byteLength: Int! = nil
    //
    // if (stream.streamError != nil) {
    //   print(stream.streamError as Any)
    // } else if (stream.hasBytesAvailable) {
    //   var data2 = Data()
    //   // read data into buffer
    //   byteLength = stream.read(buffer, maxLength: bufferSize)
    //   // append buffer to Data object so that it may be read..
    //   data2.append(buffer, length: byteLength)
    //   //
    //   print(String(data: data2 as Data, encoding: .utf8)!)
    //   print(buffer)
    //
    //   print(data)

    // }

    // //deallocate pointer memory
    // destroyUnsafeMutablePointer(buffer)
    // //close the stream
    // stream.close()
    //
    // return data
  // }

  // public func use(_ filePath: String) {
  //   //
  //   let data = NSData(contentsOfFile: filePath)!
  //   print(String(data: data as Data, encoding: .utf8)!)
  //   //
  //   let code = String(data: data as Data, encoding: .utf8)!
  //   let task = Process()
  //   task.launchPath = "/usr/bin/swift"
  //   task.arguments = ["resources/Math.swift"]
  //   task.launch()
  //   print(ProcessInfo.processInfo.environment)
  //   task.waitUntilExit()
  //
  //
  //   // let problem = Math()
  //   // let answer = problem.add(num1: 9, num2: 72)
  //   // print("the result is \(answer). Hells yes!")
  //   task.terminate()
  //
  // }


  // Start up stream from source file at glob filePath..
  public func from(_ glob: String)-> FluxStream {
    // Create readable data from InputStream
    print("1")
    let stream = initiateDataStream(filePath: glob)
    // Return self for chainability
    print("2")
    return stream
  }

  public func task(_ taskName: String, fn: ()-> Void) {
    self.tasks.append(taskName)
    fn()
  }

}



// print("What the fuck!")
// print(ProcessInfo.processInfo.environment["USER"]!)

let flux = Flux()
let fluxPlugin = flux.fluxPipe

flux.task("read") {
  return flux.from("./resources/file.txt")
  // .pipe(fluxPlugin("Well Ello!"))
  // .pipe(fluxPlugin("Ello Again!"))
}

// flux.use("./resources/Math.swift")

//
// let problem = Math()
//
// problem.printResult(problem.add(num1: 10, num2: 72))












//DONE: Create a Data class extension and pump InputStream into it.
//TODO: Create a Task Class for tasks
//TODO: Implement CLibDill Coroutines

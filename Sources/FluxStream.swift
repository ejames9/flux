/*
TransformStream.Swift

This file is an attempt to create a transform stream class ala-node.js,
for swift.

The flux.source() will return an InputStream, and flux.end() will

flux.flow("read") {
******This closure is the 2nd arg of flux.flow******
  return flux.from("./file.txt")*****Creates and returns Data InputStream*****
  .pipe(floPlugin("Hello There!"))*****pipe will pump the buffer into the out side of the transform stream
  .pipe(floPlugin("Hello There!"))
  .pipe(floPlugin("Hello There!"))
  .pipe(flux.to("../destination"))
}

Eric James Foster
*/


import Foundation







extension InputStream {
  //Pipe method, pipes data from an input stream to a given
  //OutputStream..
  public func pipe(outputStream: OutputStream)-> OutputStream {
    // Allocate memory for pointer...
    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1024)
    // Read stream data into buffer...
    self.read(buffer, maxLength: 1024)
    // Write buffer data into OutputStream...
    outputStream.write(buffer, maxLength: 1024)
    // Return stream
    return outputStream
  }
}



public class FluxStream: Stream {

  // Declare a pointer variable for the InputStream... Will be set by the getBoundStreams function in the
  // initializer..
  private var inputStreamPointer: AutoreleasingUnsafeMutablePointer<InputStream?>? = nil
  // Declare a pointer variable for the outputStream... Will be set by the getBoundStreams function in the
  // initializer..
  private var outputStreamPointer: AutoreleasingUnsafeMutablePointer<OutputStream?>? = nil

  // Declare variables that will hold the pointers to the streams.. They will be
  // named for the respective streams so that it will be more clear what they represent...
  private var inputStream: AutoreleasingUnsafeMutablePointer<InputStream?>? = nil
  // Declare outputStream pointer...
  private var outputStream: AutoreleasingUnsafeMutablePointer<OutputStream?>? = nil


  // FluxStream initialization...
  public override init() {
    //
    self.inputStreamPointer = Pointers.getAutoreleasingUnsafeMutablePointerForInputStream()
    //
    self.outputStreamPointer = Pointers.getAutoreleasingUnsafeMutablePointerForOutputStream()

    // Get some streams...
    Stream.getBoundStreams(withBufferSize: 1024, inputStream: self.inputStreamPointer, outputStream: self.outputStreamPointer)

    // Assign ISPointer to new variable with more appropriate name...
    self.inputStream = self.inputStreamPointer
    // Assign OSPointer to new var...
    self.outputStream = self.outputStreamPointer


    print("holy")
    print(self.inputStream!.Type)


    if self.inputStream != nil {
      print("help")
      print(self.inputStream as Any!)
      print("not nil")
      print(self.inputStream as Any!)
    } else {
      print("else")
      print("else2")
    }
  }

  //
  public func push(_ buffer: UnsafePointer<UInt8>)-> OutputStream {
    print("one")
    // Check for nil and write space...
    if self.outputStream != nil && self.outputStream.hasSpaceAvailable {
      print("two")
      // Write buffer to stream and collect result...
      let result = self.outputStream.write(buffer, maxLength: 1024)
      // Check for errors...
      if result == 0 {
        // log insufficient space error message...
        print("Error: Not enough space to complite buffer write...")
      } else if result < 0 {
        // log error message...
        var error: Error?
        print("7")
        print("Error: \(error!.localizedDescription)")
        print("8")
      } else {
        // Return outputStream and log success...
        print("Success: Write completed...")
      }
    }
    return self.outputStream
  }


}

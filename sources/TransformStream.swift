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






public class Math {
  public func add(num1: Int, num2: Int) {
    return num1 + num2
  }

  public func printResult(_ result: Int) {
    print("The result of your operation is: \(result)")
  }
}


//extension Data {
//  var fileContents =
//}

extension InputStream {
  //Pipe method, pipes data from an input stream to a given
  //OutputStream..
  public func pipe(outputStream: OutputStream)-> OutputStream {
    // Allocate memory for pointer...
    var buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1024)
    // Read stream data into buffer...
    self.read(buffer, maxLength: 1024)
    // Write buffer data into OutputStream...
    outputStream.write(buffer, maxLength: 1024)
    // Return stream
    return outputstream
  }
}

//
//public class TransformStream: Stream {
//  //
//  public init(source)
//}


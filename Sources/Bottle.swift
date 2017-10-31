/*
Bottle.Swift

Bottle is a subclass of Data that functions as a lightweight virtual file format to be
consumed by flux streams..

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





// File is a custom subclass of Data, which holds all the necessary data to stream
// and mutate it's contents as it passes through pipes downstream.. It is
// subclassed this way to make it convenient to work with the filesystem,
// streams and buffers...
public class File {

  // Boolean used to determine whether or not file is a Bottle file..
  public var isBottle = true

  // Source file path, will be updated to the destination path..
  public var path: String! = nil

  // File url for instantiating Data..
  public var url: URL! = nil

  // Declare buffer variable, will be used to store and transfer the mutated buffer
  public var buffer: Data! = nil

  // The length of the buffer...
  public var byteLength: Int! {
    if self.buffer != nil {
      return buffer.count
    } else {
      return nil
    }
  }

  // Declare contents member.. This is the mutable file contents..
  public var contents: String! {
    get {
      return String(data: self.buffer, encoding: .utf8)
    }
    set {
      // Clear the file data..
      self.buffer.removeAll(keepingCapacity: true)
      // Append the new data..
      self.buffer.append(newValue, count: self.byteLength)
    }
  }

  // File initializer..
  public init(_ filePath: String) {
    // Initialize member variables..
    self.path = filePath

    self.url = URL(fileURLWithPath: self.path)

    // Aquire data buffer..
    do {
      self.buffer = try Data(contentsOf: url)
    } catch let error {
      print("herer?")
      print("Error: \(error.localizedDescription)")
    }
  }
}








//TODO: Integrate Glob.swift..

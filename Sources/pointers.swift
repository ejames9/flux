/*
pointers.swift

Pointers is a class of convenience functions whose purpose is to provide allocated,
and sometimes initialized pointers of various kinds... UnsafeMutable, for example.
The class also includes functions for destroying the pointers once they are no
longer needed.

Eric James Foster
*/




import Foundation



public class Pointers {
  //
  // Convenience function for allocating and initializing UnsafeMutablePointers pointers
  private class func getUnsafeMutablePointer()-> UnsafeMutablePointer<UInt8> {
    let uint8Pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1024)
    // uint8Pointer.initialize(to: uint8Pointer.pointee, count: 1)
    return uint8Pointer
  }

  // Convenience function for destroying UnsafeMutablePointers pointers
  private class func destroyUnsafeMutablePointer(_ uint8Pointer: UnsafeMutablePointer<UInt8>) {
    // uint8Pointer.deinitialize(count: 1)
    uint8Pointer.deallocate(capacity: 1024)
  }


  // Convenience function for allocating and initializing AutoreleasingUnsafeMutablePointers<InputStream?>? pointers
  public class func getAutoreleasingUnsafeMutablePointerForInputStream()-> AutoreleasingUnsafeMutablePointer<InputStream?>? {
    // Get an UnsafeMutablePointer..
    let unsafeMutablePointerInputStream = UnsafeMutablePointer<InputStream?>.allocate(capacity: 1024)

    // Initialize an AutoreleasingUnsafeMutablePointer from the UnsafeMutablePointer...
    let pointer = AutoreleasingUnsafeMutablePointer<InputStream?>(unsafeMutablePointerInputStream)

    print("unsafeMutablePointerInputStream")
    // Deallocate memory from the UnsafeMutablePointer...
    destroyUnsafeMutablePointerInputStream(unsafeMutablePointerInputStream)
    // uint8Pointer.initialize(to: uint8Pointer.pointee, count: 1)
    return pointer
  }

  // Convenience function for allocating and initializing AutoreleasingUnsafeMutablePointer<InputStream?>? pointers
  public class func getAutoreleasingUnsafeMutablePointerForOutputStream()-> AutoreleasingUnsafeMutablePointer<OutputStream?>? {
    // Get an UnsafeMutablePointer..
    let unsafeMutablePointerOutputStream = UnsafeMutablePointer<OutputStream?>.allocate(capacity: 1024)

    // Initialize an AutoreleasingUnsafeMutablePointer from the UnsafeMutablePointer...
    let pointer = AutoreleasingUnsafeMutablePointer<OutputStream?>(unsafeMutablePointerOutputStream)

    // Deallocate memory from the UnsafeMutablePointer...
    destroyUnsafeMutablePointerOutputStream(unsafeMutablePointerOutputStream)
    // uint8Pointer.initialize(to: uint8Pointer.pointee, count: 1)
    return pointer
  }

  // Convenience function for destroying UnsafeMutablePointer<InputStream?> pointers...
  public class func destroyUnsafeMutablePointerInputStream(_ unsafeMutablePointer: UnsafeMutablePointer<InputStream?>) {
    // uint8Pointer.deinitialize(count: 1)
    unsafeMutablePointer.deallocate(capacity: 1024)
  }

  // Convenience function for destroying UnsafeMutablePointer<OutputStream?> pointers...
  public class func destroyUnsafeMutablePointerOutputStream(_ unsafeMutablePointer: UnsafeMutablePointer<OutputStream?>) {
    // uint8Pointer.deinitialize(count: 1)
    unsafeMutablePointer.deallocate(capacity: 1024)
  }
}

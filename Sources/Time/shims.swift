/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

#if os(Linux)
import Platform

@_silgen_name("strptime")
func strptime(
    _ str: UnsafePointer<Int8>!,
    _ fmt: UnsafePointer<Int8>!,
    _ tm: UnsafeMutablePointer<tm>) -> UnsafeMutablePointer<Int8>!
#endif

/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

#if os(Linux)
import Platform

@_silgen_name("strptime")
func strptime(
    _ str: UnsafePointer<Int8>!,
    _ fmt: UnsafePointer<Int8>!,
    _ tm: UnsafeMutablePointer<tm>) -> UnsafeMutablePointer<Int8>!
#endif

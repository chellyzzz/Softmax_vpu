package cpu

import chisel3._
import chisel3.util._

object LookupTreeDefault {
  def apply[T <: Data](key: UInt, default: T, mapping: Iterable[(UInt, T)]): T =
    MuxLookup(key, default)(mapping.toSeq)
}

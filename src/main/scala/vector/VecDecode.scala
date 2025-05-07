// package cpu.vector

// import chisel3._
// import chisel3.util._
// import Parameter._
// import cpu._

// class VDec extends Bundle {
//   val uop = new Uop
//   val vctrl = new VControl
//   val rs1   = UInt(5.W)
//   val rs2   = UInt(5.W)
//   val rd    = UInt(5.W)
//   val func3 = UInt(3.W)
// }

// class VecDecoder extends Module {
//   val io = IO(new Bundle {
//     val idu_in    = Input(new IDU_VEC)    
//   })

//   val ins = io.idu_in.ins
//   val uop = Wire(new Vuop)

//   val vs1 = ins(19,15)
//   val vs2 = ins(24,20)
//   val vd  = ins(11,7)
//   val funct3 = ins(14,12)
//   val funct7 = ins(31,25)

//   uop.funct3 := funct3
//   uop.funct7 := funct7
//   uop.rd := vd
//   uop.rs1 := vs1
//   uop.rs2 := vs2

//   uop.vsrc1_sel := "b00".U
//   uop.vsrc2_sel := "b00".U
//   uop.vdst_sel  := "b00".U

//   val vctrl = Wire(new VControl)

//   vctrl.vfadd := (funct3 === "b000".U) && (funct7 === "b0000000".U)
//   vctrl.vfma  := (funct3 === "b000".U) && (funct7 === "b0000100".U)
//   vctrl.vfdiv := (funct3 === "b100".U) && (funct7 === "b0000000".U)
//   vctrl.vfcvt := (funct3 === "b110".U) && (funct7 === "b0000000".U)

//   io.out.uop := uop
//   io.out.vctrl := vctrl
//   io.out.rs1 := vs1
//   io.out.rs2 := vs2
//   io.out.rd := vd
// }

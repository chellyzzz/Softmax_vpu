package millbuild

import _root_.mill.runner.MillBuildRootModule

object MiscInfo_build {
  implicit lazy val millBuildRootModuleInfo: _root_.mill.runner.MillBuildRootModule.Info = _root_.mill.runner.MillBuildRootModule.Info(
    Vector("/home/chelly/grad/npu_c/out/mill-launcher/0.11.5.jar").map(_root_.os.Path(_)),
    _root_.os.Path("/home/chelly/grad/npu_c"),
    _root_.os.Path("/home/chelly/grad/npu_c"),
    _root_.scala.Seq()
  )
  implicit lazy val millBaseModuleInfo: _root_.mill.main.RootModule.Info = _root_.mill.main.RootModule.Info(
    millBuildRootModuleInfo.projectRoot,
    _root_.mill.define.Discover[build]
  )
}
import MiscInfo_build.{millBuildRootModuleInfo, millBaseModuleInfo}
object build extends build
class build extends _root_.mill.main.RootModule {

//MILL_ORIGINAL_FILE_PATH=/home/chelly/grad/npu_c/build.sc
//MILL_USER_CODE_START_MARKER
// import Mill dependency
import mill._
import mill.define.Sources
import mill.modules.Util
import mill.scalalib.TestModule.ScalaTest
import scalalib._
// support BSP
import mill.bsp._

object ivys{
  val sv = "2.13.13"
  val chisel3 = ivy"edu.berkeley.cs::chisel3:3.6.1"
  val chisel3Plugin = ivy"edu.berkeley.cs:::chisel3-plugin:3.6.1"
  val chiseltest = ivy"edu.berkeley.cs::chiseltest:0.6.2"
  val chiselCirct = ivy"com.sifive::chisel-circt:0.6.0"
  val scalatest = ivy"org.scalatest::scalatest:3.2.2"
}

object top extends ScalaModule  {
  def chiselOpt: Option[PublishModule] = None

  override def millSourcePath = os.pwd
  def sources = T.sources(millSourcePath / "scala")

  override def scalaVersion = ivys.sv

  override def scalacOptions = Seq("-Xsource:2.13")

  override def ivyDeps = (if(chiselOpt.isEmpty) Agg(ivys.chisel3) else Agg.empty[Dep]) ++ Agg(ivys.chiselCirct)

  override def scalacPluginIvyDeps = Agg(ivys.chisel3Plugin)

}

}
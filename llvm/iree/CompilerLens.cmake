# Include in compiler/plugins/target/LLVMCPU/CMakeLists.txt after target creation.
# This compiles with IREE's own LLVM settings; do not link the standalone LLVM SDK.
if(NOT TARGET iree_compiler_plugins_target_LLVMCPU_LLVMIRPasses)
  message(FATAL_ERROR "Include CompilerLens.cmake after IREE LLVMIRPasses target creation")
endif()
get_filename_component(_compilerlens_llvm "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)
target_sources(iree_compiler_plugins_target_LLVMCPU_LLVMIRPasses PRIVATE
  "${_compilerlens_llvm}/lib/Lineage.cpp")
target_include_directories(iree_compiler_plugins_target_LLVMCPU_LLVMIRPasses PRIVATE
  "${_compilerlens_llvm}/include")

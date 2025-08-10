# generated from colcon_powershell/shell/template/prefix_chain.ps1.em

# This script extends the environment with the environment of other prefix
# paths which were sourced when this file was generated as well as all packages
# contained in this prefix path.

# function to source another script with conditional trace output
# first argument: the path of the script
function _colcon_prefix_chain_powershell_source_script {
  param (
    $_colcon_prefix_chain_powershell_source_script_param
  )
  # source script with conditional trace output
  if (Test-Path $_colcon_prefix_chain_powershell_source_script_param) {
    if ($env:COLCON_TRACE) {
      echo ". '$_colcon_prefix_chain_powershell_source_script_param'"
    }
    . "$_colcon_prefix_chain_powershell_source_script_param"
  } else {
    Write-Error "not found: '$_colcon_prefix_chain_powershell_source_script_param'"
  }
}

# source chained prefixes
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_core/8.0.32/3rdparty/stable/package/1447fb009d2104bd0e9f6db77675182874276a8e/\local_setup.ps1"
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_base/8.0.32/3rdparty/stable/package/e2aa1a7867b56974fbb69cc316bd25cf5e605a9c/\local_setup.ps1"
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_simulation/8.0.32/3rdparty/stable/package/85170a925d899f1f77fce5405261acbd68626f27/\local_setup.ps1"
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_perception/8.0.32/3rdparty/stable/package/18e6e7baf338a84a90081cc86ab83dcc08eb4ba4/\local_setup.ps1"
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_desktop/8.0.32/3rdparty/stable/package/7e8c0c3a2db01b4a1b7071d041823d5edf379d48/\local_setup.ps1"
_colcon_prefix_chain_powershell_source_script "/volume/conan_cache/bocc_to/.conan/data/ros2_desktop_full/8.0.32/3rdparty/stable/package/f4a66e1985e72bd4a19d993eb06f2bdfbfd73211/\local_setup.ps1"

# source this prefix
$env:COLCON_CURRENT_PREFIX=(Split-Path $PSCommandPath -Parent)
_colcon_prefix_chain_powershell_source_script "$env:COLCON_CURRENT_PREFIX\local_setup.ps1"

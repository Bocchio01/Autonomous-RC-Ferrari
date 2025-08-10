# generated from colcon_bash/shell/template/prefix_chain.bash.em

# This script extends the environment with the environment of other prefix
# paths which were sourced when this file was generated as well as all packages
# contained in this prefix path.

# function to source another script with conditional trace output
# first argument: the path of the script
_colcon_prefix_chain_bash_source_script() {
  if [ -f "$1" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      echo "# . \"$1\""
    fi
    . "$1"
  else
    echo "not found: \"$1\"" 1>&2
  fi
}

# source chained prefixes
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_core/8.0.32/3rdparty/stable/package/1447fb009d2104bd0e9f6db77675182874276a8e/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_base/8.0.32/3rdparty/stable/package/e2aa1a7867b56974fbb69cc316bd25cf5e605a9c/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_simulation/8.0.32/3rdparty/stable/package/85170a925d899f1f77fce5405261acbd68626f27/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_perception/8.0.32/3rdparty/stable/package/18e6e7baf338a84a90081cc86ab83dcc08eb4ba4/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_desktop/8.0.32/3rdparty/stable/package/7e8c0c3a2db01b4a1b7071d041823d5edf379d48/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="/volume/conan_cache/bocc_to/.conan/data/ros2_desktop_full/8.0.32/3rdparty/stable/package/f4a66e1985e72bd4a19d993eb06f2bdfbfd73211/"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"

# source this prefix
# setting COLCON_CURRENT_PREFIX avoids determining the prefix in the sourced script
COLCON_CURRENT_PREFIX="$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"

unset COLCON_CURRENT_PREFIX
unset _colcon_prefix_chain_bash_source_script

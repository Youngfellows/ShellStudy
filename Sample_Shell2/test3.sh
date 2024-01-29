#!/bin/bash

# 遍历列表
for apple in 苹果 香蕉 西瓜
do 
	echo $apple
done 

echo "==============================================="

# 定义列表
PARAMS=(function macro cmake_parse_arguments \
		find_library find_path find_file find_program find_package \
		cmake_policy cmake_minimum_required project include \
		string list set foreach message option if while return \
		math file configure_file \
		include_directories add_executable add_library link_libraries target_link_libraries install \
		target_sources add_custom_command add_custom_target \
		add_subdirectory aux_source_directory \
		set_property set_target_properties define_property \
		add_definitions target_compile_definitions target_compile_features \
		add_compile_options target_include_directories link_directories \
		add_link_options target_precompile_headers)

# 遍历列表
for param in ${PARAMS[@]}; 
do
	echo "${param}"
done
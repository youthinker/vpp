# Copyright (c) 2015 Cisco and/or its affiliates.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# vector packet processor

MACHINE=$(shell uname -m)

vpp_arch = native
ifeq ($(TARGET_PLATFORM),thunderx)
vpp_dpdk_target = arm64-thunderx-linuxapp-gcc
endif
vpp_native_tools = vppapigen

vpp_uses_dpdk = yes

# Uncoment to enable building unit tests
# vpp_enable_tests = yes

vpp_root_packages = vpp vom

# DPDK configuration parameters
# vpp_uses_dpdk_mlx4_pmd = yes
# vpp_uses_dpdk_mlx5_pmd = yes
# vpp_uses_external_dpdk = yes
# vpp_dpdk_inc_dir = /usr/include/dpdk
# vpp_dpdk_lib_dir = /usr/lib
# vpp_dpdk_shared_lib = yes

# Use '--without-libnuma' for non-numa aware architecture
# Use '--enable-dlmalloc' to use dlmalloc instead of mheap
vpp_configure_args_vpp = --enable-dlmalloc
sample-plugin_configure_args_vpp = --enable-dlmalloc

# load balancer plugin is not portable on 32 bit platform
ifeq ($(MACHINE),i686)
vpp_configure_args_vpp += --disable-lb-plugin
endif

vpp_debug_TAG_CFLAGS = -g -O0 -DCLIB_DEBUG -DFORTIFY_SOURCE=2 \
	-fstack-protector-all -fPIC -Werror
vpp_debug_TAG_CXXFLAGS = -g -O0 -DCLIB_DEBUG -DFORTIFY_SOURCE=2 \
	-fstack-protector-all -fPIC -Werror
vpp_debug_TAG_LDFLAGS = -g -O0 -DCLIB_DEBUG -DFORTIFY_SOURCE=2 \
	-fstack-protector-all -fPIC -Werror

vpp_TAG_CFLAGS = -g -O2 -DFORTIFY_SOURCE=2 -fstack-protector -fPIC -Werror
vpp_TAG_CXXFLAGS = -g -O2 -DFORTIFY_SOURCE=2 -fstack-protector -fPIC -Werror
vpp_TAG_LDFLAGS = -g -O2 -DFORTIFY_SOURCE=2 -fstack-protector -fPIC -Werror -pie -Wl,-z,now

vpp_clang_TAG_CFLAGS = -g -O2 -DFORTIFY_SOURCE=2 -fstack-protector -fPIC -Werror
vpp_clang_TAG_LDFLAGS = -g -O2 -DFORTIFY_SOURCE=2 -fstack-protector -fPIC -Werror

vpp_gcov_TAG_CFLAGS = -g -O0 -DCLIB_DEBUG -fPIC -Werror -fprofile-arcs -ftest-coverage
vpp_gcov_TAG_LDFLAGS = -g -O0 -DCLIB_DEBUG -fPIC -Werror -coverage

vpp_coverity_TAG_CFLAGS = -g -O2 -fPIC -Werror -D__COVERITY__
vpp_coverity_TAG_LDFLAGS = -g -O2 -fPIC -Werror -D__COVERITY__


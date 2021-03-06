
# Copyright (c) <current-year> <your-organization>
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

AUTOMAKE_OPTIONS = foreign subdir-objects

AM_CFLAGS = @CPU_FLAGS@ @DLMALLOC@ -Wall -I${top_srcdir} -I${top_builddir}
AM_LDFLAGS = -module -shared -avoid-version
AM_LIBTOOLFLAGS = --quiet
SUFFIXES = .api.h .api .api.json
API_FILES =
BUILT_SOURCES =
vppplugins_LTLIBRARIES =
vppapitestplugins_LTLIBRARIES =
noinst_HEADERS =
noinst_LTLIBRARIES =
nobase_apiinclude_HEADERS =
nobase_include_HEADERS =

vppapitestpluginsdir = ${libdir}/vpp_api_test_plugins
vpppluginsdir = ${libdir}/vpp_plugins

if ENABLE_ABF_PLUGIN
include abf.am
endif

if ENABLE_ACL_PLUGIN
include acl.am
endif

if ENABLE_AVF_PLUGIN
include avf.am
endif

if ENABLE_CDP_PLUGIN
include cdp.am
endif

if ENABLE_DPDK_PLUGIN
include dpdk.am
endif

if ENABLE_FLOWPROBE_PLUGIN
include flowprobe.am
endif


if ENABLE_GTPU_PLUGIN
include gtpu.am
endif

if ENABLE_IGMP_PLUGIN
include igmp.am
endif

if ENABLE_ILA_PLUGIN
include ila.am
endif

if ENABLE_IOAM_PLUGIN
include ioam.am
endif

if ENABLE_IXGE_PLUGIN
include ixge.am
endif

if ENABLE_LACP_PLUGIN
include lacp.am
endif

if ENABLE_LB_PLUGIN
include lb.am
endif

if ENABLE_MACTIME_PLUGIN
include mactime.am
endif

if ENABLE_MARVELL_PLUGIN
include marvell.am
endif

if ENABLE_MEMIF_PLUGIN
include memif.am
endif

if ENABLE_PPPOE_PLUGIN
include pppoe.am
endif

if ENABLE_SRV6AD_PLUGIN
include srv6_ad.am
endif

if ENABLE_SRV6AM_PLUGIN
include srv6_am.am
endif

if ENABLE_SRV6AS_PLUGIN
include srv6_as.am
endif

if ENABLE_NAT_PLUGIN
include nat.am
endif

if ENABLE_MAP_PLUGIN
include map.am
endif

if ENABLE_STN_PLUGIN
include stn.am
endif

if ENABLE_L2E_PLUGIN
include l2e.am
endif

if ENABLE_GBP_PLUGIN
include gbp.am
endif

if ENABLE_TLSMBEDTLS_PLUGIN
include tlsmbedtls.am
endif

if ENABLE_TLSOPENSSL_PLUGIN
include tlsopenssl.am
endif

if ENABLE_UNITTEST_PLUGIN
include unittest.am
endif

include ../suffix-rules.mk

# Remove *.la files
install-data-hook:
	@-(cd $(vpppluginsdir) && $(RM) $(vppplugins_LTLIBRARIES))
	@-(cd $(vppapitestpluginsdir) && $(RM) $(vppapitestplugins_LTLIBRARIES))

###############################################################################
# API
###############################################################################

apidir = $(prefix)/share/vpp/api/plugins
apiincludedir = ${includedir}/vpp_plugins

api_DATA = \
	$(patsubst %.api,%.api.json,$(API_FILES))

BUILT_SOURCES += \
	$(patsubst %.api,%.api.h,$(API_FILES))

CLEANFILES = $(BUILT_SOURCES) $(api_DATA)

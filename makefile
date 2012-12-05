# Makefile for the PtolemyII Finite State Machine (FSM) Domain ABP Demo
#
# @Authors: Christopher Hylands, based on a file by Thomas M. Parks
#
# @Version: $Id: makefile 36425 2005-02-28 20:51:43Z cxh $
#
# @Copyright (c) 1998-2005 The Regents of the University of California.
# All rights reserved.
#
# Permission is hereby granted, without written agreement and without
# license or royalty fees, to use, copy, modify, and distribute this
# software and its documentation for any purpose, provided that the
# above copyright notice and the following two paragraphs appear in all
# copies of this software.
#
# IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY
# FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
# ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF
# THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE
# PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF
# CALIFORNIA HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
# ENHANCEMENTS, OR MODIFICATIONS.
#
# 						PT_COPYRIGHT_VERSION_2
# 						COPYRIGHTENDKEY

ME =		ptolemy/domains/fsm/demo/ABP
# Root of the Ptolemy II directory
ROOT =		../../../../..


# Get configuration info
CONFIG =	$(ROOT)/mk/ptII.mk
include $(CONFIG)

# Flags to pass to javadoc. (Override value in ptII.mk)
JDOCFLAGS = 	-author -version -public

DIRS = 		#test doc

CLASSPATH = 	../../../../..

# Used to build jar files
PTPACKAGE = 	ABP
PTCLASSJAR = 	$(PTPACKAGE).jar

JSRCS = \
	DEMessageSource.java \
	DETimer.java

OTHER_FILES_TO_BE_JARED = \
	$(JSRCS) \
	ABP.xml \
	Receiver.xml

EXTRA_SRCS = \
	$(OTHER_FILES_TO_BE_JARED) \
	ABP.htm 

# Sources that may or may not be present, but if they are present, we don't
# want make checkjunk to barf on them.
MISC_FILES =	$(DIRS)

# make checkjunk will not report OPTIONAL_FILES as trash
# make distclean removes OPTIONAL_FILES
OPTIONAL_FILES = \
	doc \
	$(PTCLASSJAR) \
	'ABPApplet$$CurrentTimeThread.class' \
	'ABPApplet$$FinishButtonListener.class' \
	'ABPApplet$$GoButtonListener.class' \
	'ABPApplet$$MyExecutionListener.class' \
	'ABPApplet$$PauseButtonListener.class' \
	'ABPApplet$$TerminateButtonListener.class'

JCLASS = $(JSRCS:%.java=%.class)


all: jclass
	@echo "To run all the demos, run 'make demo'"

install: jclass $(PTCLASSJAR)

demo: demo_applet demo_ptolemy demo_vergil
demo_applet:
	CLASSPATH="$(CLASSPATH)" appletviewer ABP.htm

demo_ptolemy:
	"$(PTII)/bin/ptolemy" ABP.xml

demo_vergil:
	"$(PTII)/bin/vergil" ABP.xml

# Get the rest of the rules
include $(ROOT)/mk/ptcommon.mk
#!/usr/bin/env bash
#*******************************************************************************
# Copyright (c) 2016 IBM Corporation and others.
#
# This program and the accompanying materials
# are made available under the terms of the Eclipse Public License 2.0
# which accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#     David Williams - initial API and implementation
#*******************************************************************************

# Utility to log "dirt report"
# The required variables are expected to be in "env_file", 
# but of all those, 
# we need 
#    aggDir: top of working tree (absolute patch to aggregation module directory)
#    BUILD_ID: needed to "pretty print" to top of report. 
# output goes to "std out", and assume it is captured by calling program, as desired.

if [ $# -ne 1 ]; then
  echo USAGE: $0 env_file
  exit 1
fi

if [ ! -r "$1" ]; then
  echo "$1" cannot be read
  echo USAGE: $0 env_file
  exit 1
fi

source "$1"

printf "\n\t%s\n\n" "Dirt Report for $BUILD_ID" 
git -C "$aggDir" status --short --ignore-submodules
git -C "$aggDir" submodule foreach git status --short --ignore-submodules

#!/bin/bash

###export PYTHON_IMAGE=python:3.11.3 Can't do this as image is built by processmaker and don't know how to pass args
export PROJECT_NAME=${PWD##*/}          # to assign to a variable
export PROJECT_NAME=${PROJECT_NAME:-/}
export BUILD_IMAGE_NAME_AND_TAG=${PROJECT_NAME}_build_image:local

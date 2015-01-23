#!/bin/sh

# version configuration
# one can set the java version via environment variables
[ -z "$JAVA_VERSION" ] && JAVA_VERSION=8
[ -z "$JAVA_PATCH_VERSION" ] && JAVA_PATCH_VERSION=31


# reset env
cd $(dirname $0)

DIST_DIR=$(pwd)/dist
rm -rf $DIST_DIR
mkdir -p $DIST_DIR

# prepare java files
JRE_TAR=server-jre-${JAVA_VERSION}u${JAVA_PATCH_VERSION}-linux-x64.tar.gz
JCE_ZIP=jce_policy-${JAVA_VERSION}.zip

REQUIRED_FILES="$JRE_TAR $JCE_ZIP"
for required_file in $REQUIRED_FILES; do
	if [ ! -f $JRE_TAR ]; then
		echo "Missing $required_file" >&2
		echo "Download this file from Oracle and place it in this directory." >&2
		exit 1
	fi
done

tar xfz $JRE_TAR -C $DIST_DIR || exit $?
JRE_DIR=$DIST_DIR/java
mv $DIST_DIR/jdk1.${JAVA_VERSION}.0_${JAVA_PATCH_VERSION} $JRE_DIR

unzip -q $JCE_ZIP -d $DIST_DIR || exit $?
JCE_DIR=$DIST_DIR/UnlimitedJCEPolicyJDK${JAVA_VERSION}

# remove unnecessary files from jre distribution
rm -rf $JRE_DIR/db
rm -rf $JRE_DIR/include
rm -f $JRE_DIR/jre/README
rm -f $JRE_DIR/jre/Welcome.html
rm -rf $JRE_DIR/man
rm -f $JRE_DIR/README.html
rm -f $JRE_DIR/release

# copy over jce extension
cp $JCE_DIR/local_policy.jar $JRE_DIR/jre/lib/security/
cp $JCE_DIR/US_export_policy.jar $JRE_DIR/jre/lib/security/
rm -rf $JCE_DIR


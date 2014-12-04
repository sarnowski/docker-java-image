# Just Another Java Dockerfile

**Why?**

Licenses around open source software (in particular GPL) and the Oracle
Corporation are a minefield for commercial users. This repository only
provides tools for creating your own Java Docker image easily.

The main two problems for Java Docker images:

* Oracle Corporation: the Java license forbids redistribution of the Java
  artifacts (JDK/JRE). Bundling and uploading them publicly clearly
  redistributes them.
* Busybox base image: the official busybox Docker image is licensed with
  the GNU General Public License. It is up to your interpretation, if using
  the busybox base image forces your image to be GPL licensed too or not.

## How-To build your own Java Docker image

At first, you need to download Java from Oracle, accepting their license.
You need the following files:

* **server-jre-8u25-linux-x64.tar.gz** (Server JRE)
* **jce_policy-8.zip** (Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files for JDK/JRE 8)

Place them in the directory of this repository. Prepare all files, that your
image will need by calling the preparation script:

    $ ./prepare.sh

(If you use another version of Java than the default, you can override the
version with the environment variables `JAVA_VERSION` and `JAVA_PATCH_VERSION`)

After the script finished, you can build your Docker image as normal:

    $ docker build -t java .

Your image is no ready to use. To verify, call java:

    $ docker run -t java java -version

## License

Obviously, this has to have a 'good' open source license ;-)


    Copyright (c) 2014 Tobias Sarnowski <tobias@sarnowski.io>
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.


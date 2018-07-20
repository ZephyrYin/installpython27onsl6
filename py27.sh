TMP_PATH=~/tmp_install_python

# Versions section
PYTHON_MAJOR=2.7
PYTHON_VERSION=$PYTHON_MAJOR.14

mkdir $TMP_PATH && cd $TMP_PATH

# Update yum and libraries
yum -y update
yum install -y wget
yum install -y gcc
yum install -y unzip
yum groupinstall -y development
yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel

# Download and extract Python
wget --no-check-certificate https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar -zxvf Python-$PYTHON_VERSION.tgz

# Compile Python
cd $TMP_PATH/Python-$PYTHON_VERSION
./configure --prefix=/usr --enable-unicode=ucs4
make && make altinstall
export PATH="/usr/bin:$PATH"

# Download and Install Setuptools and PIP
cd $TMP_PATH
wget https://files.pythonhosted.org/packages/d3/3e/1d74cdcb393b68ab9ee18d78c11ae6df8447099f55fe86ee842f9c5b166c/setuptools-40.0.0.zip
unzip setuptools-40.0.0.zip && cd setuptools-40.0.0
/usr/bin/python$PYTHON_MAJOR setup.py install

# Download and Install  and PIP
cd $TMP_PATH
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
/usr/bin/python$PYTHON_MAJOR get-pip.py

# Finish installation
rm -rf $TMP_PATH
#ln -s /usr/bin/python2.7 /usr/bin/python


cd /opt/incubator-zeppelin/notebook
OLD_DIR=`date +%Y%M%d-%H%m%S`
mkdir old_${OLD_DIR}
mv 2* old_${OLD_DIR}/
rm -rf zeppelin-notebooks/
git clone https://github.com/hortonworks-gallery/zeppelin-notebooks.git
/bin/mv -f zeppelin-notebooks/* ./
chown -R zeppelin:hadoop *
/opt/incubator-zeppelin/bin/zeppelin-daemon.sh restart


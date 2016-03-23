cd /usr/hdp/current/zeppelin-server/lib/notebook
OLD_DIR=`date +%Y%m%d-%H%M%S`
mkdir old_${OLD_DIR}
mv 2* old_${OLD_DIR}/
rm -rf zeppelin-notebooks/
git clone https://github.com/hortonworks-gallery/zeppelin-notebooks.git
/bin/mv -f zeppelin-notebooks/* ./
chown -R zeppelin:hadoop *
sudo -u zeppelin /usr/hdp/current/zeppelin-server/lib/bin/zeppelin-daemon.sh restart

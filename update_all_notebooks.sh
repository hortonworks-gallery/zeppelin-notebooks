if [ -d "/usr/hdp/current/zeppelin-server/notebook" ]; then
  NOTES_DIR="/usr/hdp/current/zeppelin-server/notebook"
else
  NOTES_DIR="/usr/hdp/current/zeppelin-server/lib/notebook"
fi

cd $NOTES_DIR
OLD_DIR=`date +%Y%m%d-%H%M%S`
mkdir old_${OLD_DIR}
mv 2* old_${OLD_DIR}/
rm -rf zeppelin-notebooks/
git clone -q --progress https://github.com/hortonworks-gallery/zeppelin-notebooks.git
/bin/mv -f zeppelin-notebooks/* ./
chown -R zeppelin:hadoop *
echo Restarting Apache Zeppelin...
/usr/hdp/current/zeppelin-server/lib/bin/zeppelin-daemon.sh restart &> /dev/null
echo Done!

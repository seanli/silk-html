chown kite /home/kite
echo $SSH_KEY > /home/kite/.ssh/authorized_keys
/usr/local/bin/supervisord -n

cd 

cd system-report/

df -h | grep sda[0-9] > a.info 2>> a.error

cat /proc/meminfo | grep MemTotal  >> a.info 2>> a.error

cat /proc/cpuinfo | grep siblings | head -n 1 >> a.info 2>> a.error

lspci |grep VGA >> a.info 2>> a.error

lspci -v -s 01:00.0 >> a.info 2>> a.error

cd

du -hs > system-report/b.info 2>> system-report/b.error

du -h --max-depth=1>> system-report/b.info 2>> system-report/b.error

quota>> system-report/b.info 2>> system-report/b.error


ps -aux | grep ^`whoami`> system-report/c.info 2>> system-report/c.error

top -u $USER -b -o +%MEM -n 1 | head -n 17 | tail -n +7 >> system-report/c.info 2>> system-report/c.error

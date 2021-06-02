 #!/bin/bash
                    yum update -y
                    yum install httpd -y
                    service httpd start
                    cd /var/www/html/
                    echo "apache web" > index.html
                    chkconfig httpd on

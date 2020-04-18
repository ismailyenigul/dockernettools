FROM alpine:edge


RUN apk add --update --no-cache  \
		       --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
		       mysql-client \
		       postgresql-client \
 		       curl \
		       bind-tools \
		       wget \
                       openssh-client \
		       bind-tools \
		       iputils \
		       jq \
		       netcat-openbsd \
		       net-tools \
		       busybox-extras \
		       swaks\
		       vim \
		       nano  \
		       python3 py3-pip \
		       bash && \
                       pip3 install --upgrade pip setuptools httpie && \
 		       rm -r /root/.cache
USER 1001
CMD ["sh", "-c", "tail -f /dev/null"]
		        	

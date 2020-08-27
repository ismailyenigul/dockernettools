FROM alpine:3.11


RUN apk add --update --no-cache  \
		       --repository http://dl-3.alpinelinux.org/alpine/edge/main/ \
		       mysql-client \
		       postgresql-client \
 		       redis \
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
		       vim \
		       git \
		       nano  \
		       python3 py3-pip \
		       bash && \
              pip3 install --upgrade pip setuptools httpie

RUN apk add --update --no-cache  \
		       --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
			   swaks 
			
RUN apk add --update --no-cache  \
		       --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
			   yq 

RUN pip3 install shyaml

#Install awscli 2.0
ENV GLIBC_VER=2.31-r0

# install glibc compatibility for alpine
RUN apk --no-cache add \
        binutils \
        curl \
    && curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
    && apk add --no-cache \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk \
    && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples \
    && apk --no-cache del \
        binutils \
    && rm glibc-${GLIBC_VER}.apk \
    && rm glibc-bin-${GLIBC_VER}.apk
    

RUN apk add --update --no-cache  \
		       --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/community \
			   --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main \
			  mongodb yaml-cpp=0.6.2-r2 

RUN  rm -rf /var/cache/apk/* \
	 rm -r /root/.cache
RUN adduser -S user  -G root
USER user
WORKDIR /home/user

CMD ["sh", "-c", "tail -f /dev/null"]
		        	

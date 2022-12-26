FROM node:18.12.1-buster-slim
ENV LANG en_US.utf8
#create ctf user
RUN useradd -m ctf
#install openssh server and configure it
RUN apt-get update && apt-get install -y openssh-server
RUN dpkg-reconfigure openssh-server
RUN service ssh start
RUN sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config
RUN sed -i '/#PermitRootLogin prohibit-password/c\PermitRootLogin no' /etc/ssh/sshd_config
#change ssh port to 1000
RUN sed -i '/#Port 22/c\Port 1000' /etc/ssh/sshd_config
RUN service ssh restart
#copy application folder into container
WORKDIR /app
COPY --chown=ctf:ctf ./application .
RUN npm install
#install and configure sudo
RUN apt-get install -y sudo
#make authorized_keys file 
RUN sudo -u ctf mkdir /home/ctf/.ssh
RUN sudo -u ctf touch /home/ctf/.ssh/authorized_keys
RUN chmod -R 700 /home/ctf/.ssh
#copy a flag
COPY --chown=ctf:ctf ./flag /home/ctf/flag
USER root
RUN chmod +x run.sh
CMD ["sh","run.sh"]
EXPOSE 3000

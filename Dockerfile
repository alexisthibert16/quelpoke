FROM debian                                 
RUN apt update                              
RUN apt install -y nginx                    
COPY index.tmpl.html /var/www/html/              
ENTRYPOINT ["nginx", "-g", "daemon off;"]  

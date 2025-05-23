# Sử dụng image Tomcat 11 với JDK 17
FROM tomcat:11.0-jdk17

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file WAR vào thư mục webapps với tên ROOT.war
COPY ./dist/Project_Prj301_Group6_Netbeans.war /usr/local/tomcat/webapps/ROOT.war

# Sửa file server.xml để đổi cổng từ 8080 sang 9998
RUN sed -i 's/Connector port="8080"/Connector port="9998"/' /usr/local/tomcat/conf/server.xml

# Mở cổng 9998
EXPOSE 9998

# Khởi động Tomcat
CMD ["catalina.sh", "run"]
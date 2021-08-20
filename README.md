配置启动Main class: org.apache.catalina.startup.Bootstrap
配置VM OPTIONS:
	-Dcatalina.home= 实际项目地址/home
	-Dcatalina.base= 实际项目地址/home
	-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager
	-Djava.util.logging.config.file= 实际项目地址/home/conf/logging.properties
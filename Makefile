start:
	for folder in hummingbot_conf hummingbot_logs hummingbot_data hummingbot_scripts; do mkdir -p hummingbot_files/$$folder; done
	mkdir -p hummingbot_files/hummingbot_conf/connectors
	docker run -it \
		--name hummingbot-instance \
		--mount "type=bind,source=$$(pwd)/hummingbot_files/hummingbot_conf,destination=/conf/" \
		--mount "type=bind,source=$$(pwd)/hummingbot_files/hummingbot_logs,destination=/logs/" \
		--mount "type=bind,source=$$(pwd)/hummingbot_files/hummingbot_data,destination=/data/" \
		--mount "type=bind,source=$$(pwd)/hummingbot_files/hummingbot_scripts,destination=/scripts/" \
		hummingbot/hummingbot:latest
clean: 
	docker container rm -f hummingbot-instance
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obeaj <obeaj@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/12 15:36:04 by obeaj           #+#    #+#              #
#    Updated: 2022/12/12 15:36:05 by obeaj          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

build:
	mkdir -p /Users/obeaj/Desktop/data
	mkdir -p /Users/obeaj/Desktop/data/database_volume 
	mkdir -p /Users/obeaj/Desktop/data/wordpress_volume
	docker-compose -f ./srcs/docker-compose.yml up --build

run:
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker volume rm $$(docker volume ls -q);\
	rm -rf /Users/obeaj/Desktop/data;\

fclean: down
	docker system prune -a -f;\
	rm -rf /Users/obeaj/Desktop/data;\

.PHONY: build run stop clean fclean
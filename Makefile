# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jvacaris <jvacaris@student.42madrid.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/02 19:09:08 by jvacaris          #+#    #+#              #
#    Updated: 2023/10/02 19:15:02 by jvacaris         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@echo "up in progress..."
	@docker-compose -f srcs/docker-compose.yml up

up:
	@echo "up in progress..."
	@docker-compose -f srcs/docker-compose.yml up

upbuild: 
	@echo "up with --build flag in progress..."
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@echo "down in progress..."
	@docker-compose -f srcs/docker-compose.yml down

prune:
	@echo "system prune in progress..."
	@docker system prune -af

volreset:
	@echo "Deleting the content of the mariadb and wordpress volumes"
	@rm -rf ../data/mariadb/*
	@rm -rf ../data/wordpress/*







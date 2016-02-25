# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdel-car <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/25 16:12:54 by fdel-car          #+#    #+#              #
#    Updated: 2016/02/25 18:57:13 by fdel-car         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRCS = FdF.c

OBJS = $(SRCS:.c=.o)

CFLAGS = -Wall -Wextra -Werror
MLXFLAGS = -lmlx -framework OpenGL -framework AppKit

all: $(NAME)

$(NAME): $(OBJS)
	cd libft && make re && cd ..
	gcc $(CFLAGS) -o $@ $^ ./libft/libft.a $(MLXFLAGS)

%.o: %.c
	gcc $(CFLAGS) -c $^ -I./libft/includes

clean:
	rm -rf $(OBJS)
fclean: clean
	rm -rf $(NAME)

re: fclean
	make all

.PHONY: all clean fclean re
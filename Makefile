NAME 		=	libft.a

SHELL		:= 	/bin/bash
COUNT		:= 	0

BLACK  		 = \033[0;30m
RED    		 = \033[0;31m
GREEN  		 = \033[0;32m
YELLOW 		 = \033[0;33m
BLUE   		 = \033[0;34m
MAGENTA		 = \033[0;35m
CYAN   		 = \033[0;36m
WHITE  		 = \033[0;37m
RESET  		 = \033[0m

INCLUDES 	=	includes/
PATH_SRCS 	=	sources/
PATH_OBJS 	=	objects/

FILES 		= 	ft_atoi ft_isalnum ft_isalpha ft_isascii \
				ft_isdigit ft_isprint ft_tolower ft_toupper \
				ft_strlen ft_strncmp ft_strdup ft_strlcat \
				ft_strlcpy ft_strchr ft_strrchr ft_strnstr \
				ft_bzero ft_calloc ft_memcmp ft_memchr \
				ft_memset ft_memmove ft_memcpy ft_substr \
				ft_strjoin ft_strtrim ft_striteri ft_putchar_fd \
				ft_putstr_fd ft_putendl_fd ft_putnbr_fd ft_itoa \
				ft_split ft_strmapi ft_lstnew ft_lstadd_front \
				ft_lstsize ft_lstlast ft_lstadd_back ft_lstdelone \
				ft_lstclear ft_lstiter ft_lstmap get_next_line \
				get_next_line_utils ft_printf ft_printf_utils \

OBJS 		=	$(addprefix $(PATH_OBJS), $(addsuffix .o, $(FILES) ) )
SRCS 		=	$(addsuffix .c, $(FILES) ) 
CFLAGS 		=	-Wall -Werror -Wextra -g3

all : $(NAME)

$(NAME) : $(PATH_OBJS) $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@printf "\n$(MAGENTA)Libft was compiled\n$(RESET)"

$(PATH_OBJS):
	@mkdir -p $(PATH_OBJS)

$(PATH_OBJS)%.o : $(PATH_SRCS)%.c 
	@$(eval COUNT=$(shell expr $(COUNT) + 1))
	@cc $(CFLAGS) -I $(INCLUDES) -c $< -o $@
	@printf "$(GREEN)Compiling libft %d%%\r$(RESET)" $$(echo $$(($(COUNT) * 100 / $(words $(SRCS)))))

clean :
	@rm -rf $(PATH_OBJS)
	@printf "$(RED)Deleted objects$(RESET)\n"

fclean : clean
	@rm -f $(NAME)
	@printf "$(RED)Libft is deleted$(RESET)\n"

re : fclean all

.PHONY : all clean fclean re

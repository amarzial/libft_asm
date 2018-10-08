	SRC = src/ft_bzero.s \
		  src/ft_strcat.s \
		  src/ft_isalpha.s \
		  src/ft_isdigit.s \
		  src/ft_isalnum.s \
		  src/ft_isascii.s \
		  src/ft_isprint.s \
		  src/ft_toupper.s \
		  src/ft_tolower.s \
		  src/ft_puts.s \
		  src/ft_strlen.s \
		  src/ft_memset.s \
		  src/ft_memcpy.s \
		  src/ft_strdup.s \
		  src/ft_cat.s \
		  src/ft_strchr.s \
		  src/ft_memchr.s \
		  src/ft_memmove.s \
		  src/ft_isspace.s \
		  src/ft_atoi.s

OBJ = $(addprefix obj/,$(notdir $(SRC:.s=.o)))

NAME = libfts.a

all: $(NAME)

$(NAME): $(OBJ)
	ar -rc $(NAME) $(OBJ)

obj/%.o: src/%.s
	@mkdir -p obj/
	nasm -fmacho64 -o $@ $< 

test: $(NAME) src/main.c
	$(CC) -O0 -g -o main src/main.c $(NAME)
	./main

clean:
	rm -rf obj/

fclean: clean
	rm -f $(NAME)
	rm -f main

re: fclean all

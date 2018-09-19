SRC = src/bzero.s \
	  src/strcat.s

OBJ = $(addprefix obj/,$(notdir $(SRC:.s=.o)))

NAME = libfts.a

all: $(NAME)

$(NAME): $(OBJ)
	ar -rc $(NAME) $(OBJ)

obj/%.o: src/%.s
	@mkdir -p obj/
	nasm -fmacho64 -o $@ $< 

main: $(NAME)
	$(CC) -o main main.c $(NAME)

clean:
	rm -rf obj/

fclean:
	rm -f $(NAME)
	rm -f main

re: fclean all

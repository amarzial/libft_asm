SRC = src/bzero.s \
	  src/strcat.s \
	  src/isalpha.s \
	  src/isdigit.s \
	  src/isascii.s \
	  src/isprint.s \
	  src/toupper.s \
	  src/tolower.s \
	  src/puts.s

OBJ = $(addprefix obj/,$(notdir $(SRC:.s=.o)))

NAME = libfts.a

all: $(NAME)

$(NAME): $(OBJ)
	ar -rc $(NAME) $(OBJ)

obj/%.o: src/%.s
	@mkdir -p obj/
	nasm -fmacho64 -o $@ $< 

main: $(NAME) src/main.c
	$(CC) -o main src/main.c $(NAME)

clean:
	rm -rf obj/

fclean:
	rm -f $(NAME)
	rm -f main

re: fclean all

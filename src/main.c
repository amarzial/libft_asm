#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <fcntl.h>

void ft_bzero(void *, size_t);
char *ft_strcat(char *, char *);
int ft_isalpha(int);
int ft_isdigit(int);
int ft_isascii(int);
int ft_isprint(int);
int ft_toupper(int);
int ft_tolower(int);
int ft_puts(const char *);
size_t ft_strlen(const char*);
void *ft_memset(void *, int, size_t);
void *ft_memcpy(void *, void *, size_t);
char *ft_strdup(char*);
void ft_cat(int fd);
char *ft_strchr(char*, int);
void *ft_memchr(void*, int, size_t);
void *ft_memmove(void* dst, void *src, size_t size);
int ft_isspace(int);
int ft_atoi(char*);

void randomize_string(char *str, size_t size)
{
	size_t i;
	for (i = 0; i < size; ++i)
	{
		str[i] = (rand() % (126 - 30)) + 30;
	}
	str[i] = '\0';
}

int main()
{
	//bzero
	{
		const size_t size = 100000;
		char arr[size];
		char ref[size];

		memset(arr, 8, size);
		ft_bzero(arr, 0);
		int ok = 1;
		for (int k = 0; k < size; k++)
		{
			if (arr[k] != 8)
			{
				ok = 0;
				break;
			}
		}
		assert(ok);
		memset(ref, 2, size);
		arr[size - 1] = 9;
		ref[size - 1] = 9;
		ft_bzero(arr, size - 1);
		bzero(ref, size - 1);
		assert(memcmp(arr, ref, size) == 0);
		printf("bzero: passed\n");
	}
	//strcat
	{
		int size = 1000;
		char *s1 = (char*)malloc(size + 1);
		char *s2;
		char *ret;
		s1[0] = '\0';
		s2 = "cat to empty string";
		ret = ft_strcat(s1, s2);
		assert(strcmp(s1, s2) == 0);

		randomize_string(s1, 100);
		char *tmp = strdup(s1);
		s2 = "";
		ret = ft_strcat(s1, s2);
		assert(strcmp(s1, tmp) == 0);
		free(tmp);

		randomize_string(s1, 500);
		tmp = strdup(s1);
		s2 = "cat normal string";
		ret = ft_strcat(s1, s2);
		assert(strcmp(s1, strcat(tmp, s2)) == 0);
		free(tmp);
		free(s1);

		printf("strcat: passed\n");
	}
	//isalpha
	{
		for (char i = 0; i < 127; ++i)
		{
			assert((ft_isalpha(i) != 0) == (isalpha(i) != 0));
		}
		printf("isalpha: passed\n");
	}
	//isdigit
	{
		for (char i = 0; i < 127; ++i)
		{
			assert((ft_isdigit(i) != 0) == (isdigit(i) != 0));
		}
		printf("isdigit: passed\n");
	}
	//isascii
	{
		for (unsigned char i = 0; i < 255; ++i)
		{
			assert((ft_isascii(i) != 0) == (isascii(i) != 0));
		}
		printf("isascii: passed\n");
	}
	//isascii
	{
		for (unsigned char i = 0; i < 255; ++i)
		{
			assert((ft_isprint(i) != 0) == (isprint(i) != 0));
		}
		printf("isprint: passed\n");
	}
	//toupper
	{
		for (unsigned char i = 0; i < 255; ++i)
		{
			assert((ft_toupper(i) != 0) == (toupper(i) != 0));
		}
		printf("toupper: passed\n");
	}
	//tolower
	{
		for (unsigned char i = 0; i < 255; ++i)
		{
			assert((ft_tolower(i) != 0) == (tolower(i) != 0));
		}
		printf("tolower: passed\n");
	}
	//puts
	{
		write(1, "puts: test null -> ", 19);
		ft_puts(NULL);
		write(1, "puts: ", 6);
		ft_puts("passed");
	}
	//strlen
	{
		char str[] = "Montpellier, first mentioned in a document of 985, was \
					  founded under a local feudal dynasty, the Guilhem, \
					  who combined two hamlets and built a castle and walls \
					  around the united settlement. \
					  The two surviving towers of the city walls, \
					  the Tour des Pins and the Tour de la Babotte, \
					  were built later, around the year 1200.";
		int l1, l2;
		l1 = ft_strlen(str);
		l2 = strlen(str);
		assert(ft_strlen(str) == strlen(str));
		assert(ft_strlen("") == 0);
		printf("strlen: passed\n");

	}
	//memset
	{
		const size_t size = 100000;
		char arr[size];
		char ref[size];
		char *ret;

		ft_memset(arr, 8, size);
		memset(ref, 8, size);
		ret = ft_memset(arr, 3, size / 2);
		memset(ref, 3, size / 2);
		assert(memcmp(arr, ref, size) == 0);
		ft_memset(arr, 15, 0);
		assert(memcmp(arr, ref, size) == 0);
		assert(ret = arr);
		printf("memset: passed\n");
	}
	//memcpy
	{
		const int size = 10000;
		char arr[size];
		char dest[size];
		for (int i = 0; i < size; ++i)
		{
			arr[i] = i % 0x100;
		}
		char *res = ft_memcpy(dest, arr, size);
		assert(memcmp(dest, arr, size) == 0);
		assert(res = dest);
		printf("memcpy: passed\n");
	}
	//strdup
	{
		char *str = "passed";
		char *dup;

		dup = ft_strdup(str);
		assert(dup != NULL);
		printf("strdup: %s\n", dup);
		free(dup);
	}
	//cat
	{
		int fd;
		fd = open("author", O_RDONLY);
		assert(fd > 0);
		printf("cat should print the author's name: \n");
		ft_cat(fd);
		close(fd);
	}
	printf("extra functions:---------------------\n");
	//strchr
	{
		int c;
		char *res;
		char str[] = "hello m9! how are you?";
		int pos = 7;
		c = '8';

		str[pos] = c;
		res = ft_strchr(str, c);
		assert(*res == c);
		assert(ft_strchr(str, '\0'));
		assert(!ft_strchr(str, '#'));
		printf("strchr: passed\n");
	}
	//memchr
	{
		int c;
		char *res;
		char str[] = "still me m8. cant get red of me so easily!";
		size_t len = ft_strlen(str);
		c = '8';

		res = ft_memchr(str, '!', len);
		assert(*res == '!');
		assert(ft_memchr(str, 0, len) == 0);
		assert(!ft_memchr(str, '#', len));
		printf("memchr: passed\n");
	}
	//memmove
	{
		const int size = 1000;
		char s1[size + 1];
		char s2[size + 1];
		char *ret;
		randomize_string(s1, size);
		strcpy(s2, s1);
		ret = ft_memmove(s1, s1, size);
		memmove(s2, s2, size);
		assert(memcmp(s1, s2, size + 1) == 0);
		assert(ret == s1);
		ft_memmove(s1, s1 + 500, 100);
		memmove(s2, s2 + 500, 100);
		assert(memcmp(s1, s2, size + 1) == 0);
		assert(ret == s1);
		ft_memmove(s1 + 200, s1, 100);
		memmove(s2 + 200, s2, 100);
		assert(memcmp(s1, s2, size + 1) == 0);
		assert(ret == s1);
		printf("memmove: passed\n");
	}
	//isspace
	{
		for (int i = 0; i < 127; ++i)
		{
			assert((ft_isspace(i) != 0) == (isspace(i) != 0));
		}
		printf("isspace: passed\n");
	}
	//atoi
	{
		int res;
		res = ft_atoi("12345");
		assert(res == 12345);
		res = ft_atoi("0");
		assert(res == 0);
		res = ft_atoi(" 1hello");
		assert(res == 1);
		res = ft_atoi("     ");
		assert(res == 0);
		res = ft_atoi("-312");
		assert(res == -312);
		res = ft_atoi("+55hs23s");
		assert(res == 55);
		res = ft_atoi("-2147483648");
		assert(res == -2147483648);
		res = ft_atoi("2147483647");
		assert(res == 2147483647);
		res = ft_atoi("not");
		assert(res == 0);
		printf("atoi: passed\n");
	}
	return 0;
}

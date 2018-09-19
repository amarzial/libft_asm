#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
void ft_bzero(void *, size_t);
char *ft_strcat(char *, char *);
int ft_isalpha(int);
int ft_isdigit(int);
int ft_isascii(int);
int ft_isprint(int);
int ft_toupper(int);
int ft_tolower(int);
int ft_puts(const char *);

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
		ft_bzero(arr, size);
		bzero(ref, size);
		assert(memcmp(arr, ref, size) == 0);
		printf("bzero: passed\n");
	}
	//strcat
	{
		char s1[100] = "my strcat: ";
		char *s2 = "working";
		ft_strcat(s1, s2);
		assert(strcmp(s1, "my strcat: working") == 0);
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
		write(1, "puts: ", 6);
		ft_puts("passed");
	}
	return 0;
}

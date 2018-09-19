#include <stdio.h>
#include <stdlib.h>
void ft_bzero(void *, size_t);
char *ft_strcat(char *, char *);

int main()
{
	//bzero
	{
	const size_t size = 10;
	char arr[size] = "hello";

	ft_bzero(arr + 1, 0);
	printf("%s\n", arr);
	}
	//strcat
	{
		char s1[100] = "my strcat: ";
		char *s2 = "working";
		printf("%s\n", ft_strcat(s1, s2));
	}
	return 0;
}

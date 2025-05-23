#include "../include/libasm.h"
#include <stdio.h>

void	test_ft_striteri(unsigned int n, char *str) {
	printf("param 1: %u \tparam 2: %s\n", n, str);
}

int main(void)
{
	ft_striteri("ABC", test_ft_striteri);
	ft_striteri("ABCCC", test_ft_striteri);
	ft_striteri("", test_ft_striteri);
	ft_striteri("AB\0C", test_ft_striteri);

	// printf("ABD ncmp ABC n = 3: %d\n", ft_strncmp("ABD", "ABC", 3)); // ควรได้ 1
	// printf("ABC ncmp ABD n = 3: %d\n", ft_strncmp("ABC", "ABD", 3)); // ควรได้ -1
	// printf("ABC ncmp ACC n = 3: %d\n", ft_strncmp("ABC", "ABD", 3)); // ควรได้ -1
	// printf("ACC ncmp ABC n = 3: %d\n", ft_strncmp("ABC", "ABD", 3)); // ควรได้ 1

	// printf("ABC ncmp NULL n = 3: %d\n", ft_strncmp("ABC", "", 3)); // ควรได้ 65
	// printf("NULL ncmp ABC n= 3: %d\n", ft_strncmp("", "ABD", 3)); // ควรได้ -65

	// printf("ABC ncmp ABD n = 0: %d\n", ft_strncmp("ABC", "ABD", 0)); // ควรได้ 0

	// printf("NULL: %ld\n", ft_strlen("")); // ควรได้ 0
	// printf("ABC: %ld\n", ft_strlen("ABC")); // ควรได้ 3
	// printf("ABC: %ld\n", ft_strlen("A B C")); // ควรได้ 5
	// printf("ABC: %ld\n", ft_strlen(" A\0BC")); // ควรได้ 2

	// printf("ft_isupper('A'): %d\n", ft_isupper('A')); // ควรได้ 1
    // printf("ft_isupper('z'): %d\n", ft_isupper('z')); // ควรได้ 0

	// printf("ft_islower('A'): %d\n", ft_islower('A')); // ควรได้ 0
    // printf("ft_islower('a'): %d\n", ft_islower('a')); // ควรได้ 1

	// printf("ft_isalpha('A'): %d\n", ft_isalpha('A')); // ควรได้ 1
    // printf("ft_isalpha('z'): %d\n", ft_isalpha('z')); // ควรได้ 1
    // printf("ft_isalpha('1'): %d\n", ft_isalpha('1')); // ควรได้ 0

    // printf("ft_isdigit('z'): %d\n", ft_isdigit('z')); // ควรได้ 0
    // printf("ft_isdigit('1'): %d\n", ft_isdigit('1')); // ควรได้ 1

	// printf("ft_isalnum('A'): %d\n", ft_isalnum('A')); // ควรได้ 1
    // printf("ft_isalnum('z'): %d\n", ft_isalnum('z')); // ควรได้ 1
    // printf("ft_isalnum('1'): %d\n", ft_isalnum('1')); // ควรได้ 1
	// printf("ft_isalnum('newline'): %d\n", ft_isalnum('\n')); // ควรได้ 0

	// printf("ft_isascii('8'): %d\n", ft_isascii('8')); // ควรได้ 1
    // printf("ft_isascii('z'): %d\n", ft_isascii('z')); // ควรได้ 1
	// printf("ft_isascii(130): %d\n", ft_isascii(130)); // ควรได้ 0
	// printf("ft_isascii(-1): %d\n", ft_isascii(-1)); // ควรได้ 0
	// printf("ft_isascii('\\t'): %d\n", ft_isascii('\t')); // ควรได้ 1

    return 0;
}

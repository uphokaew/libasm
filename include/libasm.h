#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h>

int ft_islower(int c);
int ft_isupper(int c);
int ft_isalnum(int c);
int ft_isalpha(int c);
int ft_isascii(int c);
int ft_isdigit(int c);

size_t	ft_strlen(const char *str);
int		ft_strncmp(const char *s1, const char *s2, size_t n);

#endif

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: revieira <revieira@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/02 21:08:22 by revieira          #+#    #+#             */
/*   Updated: 2022/11/16 11:58:37 by revieira         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

void	*ft_calloc(size_t nmemb, size_t size)
{
	char	*ptr;
	size_t	result;

	result = nmemb * size;
	if (result / nmemb != size || result / size != nmemb)
		return (NULL);
	ptr = malloc(result);
	if (!ptr)
		return (0);
	ft_memset (ptr, 0, result);
	return (ptr);
}

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: revieira <revieira@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/21 18:44:16 by coder             #+#    #+#             */
/*   Updated: 2022/11/16 12:00:33 by revieira         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*newlist;
	t_list	*head;

	head = NULL;
	if (!lst)
		return (0);
	while (lst)
	{
		newlist = ft_lstnew((*f)(lst->content));
		if (!newlist)
		{
			ft_lstclear(&head, del);
			return (NULL);
		}
		ft_lstadd_back(&head, newlist);
		lst = lst->next;
	}
	newlist->next = NULL;
	return (head);
}

<#include "header.ftl">
	
	<#include "menu.ftl">

	<#if (content.title)??>
	<div class="page-header">
		<h1>${content.title}</h1>
	</div>
	<#else></#if>

	<p><em>${content.date?string("dd MMMM yyyy")} - by - ${content.author}</em></p>

	<p>${content.body}</p>

	<hr />
	
<#include "footer.ftl">
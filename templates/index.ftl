<#include "header.ftl">
	
	<#include "menu.ftl">

    <#include "carousel.ftl">

	<#-- <div class="page-header">
			<h1>CongoCC Blog</h1>
		</div>
	-->
	<div class="blog-intro">
	    <h2>Welcome to the Congo - CongoCC, that is</h2>
	    <p>CongoCC is an open-source resource site that provides <strong>C</strong>ode-generation <strong>C</strong>omponents, currently:</p>
	        <ul>
	            <li>Up-to-date Java parsers (Java 8 - 18 supported)</li>
	            <li>Python 3.10 parsers </li>
	            <li>C# parser </li>
	        </ul>
	    <p>Plans for other code-generation tools include: </p>
	        <ul>
	            <li>Updating FreeMarker, a leading templating engine</li>
	        </ul>
	    <h3>The Congo Rainforest is the World's Second Largest Rainforest</h3>
	    <p>The common link between the Congo and the resources available from CongoCC is the presence of trees - real, physical trees in the rainforest and AST trees in CongoCC parsers. As this website develops and evolves, more blogs will added that describe how the grammar files that you write are processed by the CongoCC jar file to generate compilable code that can be used to parse Java, Python, or C# text files.</p> 
	    <p>To learn more about the history and evolution of the CongoCC project, click on the About menu option. The CongoCC repository can be cloned from https://github.com/congo-cc/</p>
	    <h3 class="divider-h3">Individual Blogs Are Listed Below<h3>
	</div>
	<#list posts as post> <#-- should this be limited to 10 or 15 posts? -->
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h1>${post.title}</h1></a>
  			<p>${post.date?string("dd MMMM yyyy")} by ${post.author}</p>
  			<#--  <p>${post.body}</p>  SHOWS whole blog - should show just start of blog -->
			<#include "lede.ftl">  <#-- display first 1,000 chars of post -->
  		</#if>
  	</#list>
	
	<hr />
	
	<p>Older posts are available in the <a href="${content.rootpath}${config.archive_file}">archive</a>.</p>  

<#include "footer.ftl">

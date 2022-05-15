<#--  <p>The author ${post.author} says hello</p> -->
<#-- the following only works if the number of opening <xxx> match closing </xxx>. However <p> without closing </p> is generally tolerated.-->
<#assign ledesnippet = post.body?truncate(1000)>
<p>${ledesnippet}&nbsp;&nbsp;&nbsp;&nbsp;<a href=${post.uri}>Read More...</a></p>
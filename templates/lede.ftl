<#-- extract the first chunk of any post for display on index.html -->
<#assign temp = post.body?truncate(1000)>
<#assign offset = temp?index_of("<div class=\"image")>
<#if offset lt 0> <#-- didn't find an image - this is probably most common case -->
    <#assign ledesnippet = temp>
<#else>
    <#assign offset1 = temp?index_of("</div>", offset)>
    <#if offset1 lt 0>  <#-- did not find closure for class="content" (or for imageblock) -->
        <#assign ledesnippet = temp[0..offset-1]> <#-- truncate starting at imageblock - assume 1000 char trunc before imageblock closed-->
    <#else>
        <#assign offset2 = temp?index_of("</div>", offset1)> 
        <#if offset2 lt 0> <#-- did not find </div> for class="imageblock" - this is unlikely -->
            <#assign ledesnippet = temp[0..offset-1]> <#-- truncate starting at imageblock - assume 1000 char trunc before imageblock closed-->
        <#else>
            <#assign ledesnippet = temp[0..offset-1] + "<p>--> Read post to view image <--</p>" + temp[offset2+6..]>
        </#if>
    </#if>
</#if>
<#-- At this point, ledesnippet should contain the non-image/de-imagized chunk that is almost ready to display - need to handle broken unordered list -->
<#assign uoffset = ledesnippet?last_index_of("class=\"ulist")> <#-- look for last instance of an unordered list -->
<#if uoffset gte 0> <#-- found one - do nothing if one wasn't found -->
    <#assign divoffset = ledesnippet?index_of("</div>", uoffset)>
    <#if divoffset lt 0> <#-- didn't find closing div for ulist -->
        <#assign ledesnippet = ledesnippet + "</div>"> <#-- add the closing div - doesn't manage unclosed <li> but works OK -->
    </#if>
</#if>
<#-- IF post has an ORDERED list instead, need to make sure that it has closing div NOTE: cannot handle nested lists of either type 80:20 Rule -->
<#assign ordoffset = ledesnippet?last_index_of("class=\"olist")> <#-- look for last instance of an ordered list -->
<#if ordoffset gte 0> <#-- found one - do nothing if one wasn't found -->
    <#assign orddivoffset = ledesnippet?index_of("</div>", ordoffset)>
    <#if orddivoffset lt 0> <#-- didn't find closing div for ordered list -->
        <#assign ledesnippet = ledesnippet + "</div>"> <#-- add the closing div - doesn't manage unclosed <li> but works OK -->
    </#if>
</#if>
<p>${ledesnippet}&nbsp;&nbsp;&nbsp;&nbsp;<a href=${post.uri}>Read More...</a></p>  <#-- need some kind of divider after each lede ->
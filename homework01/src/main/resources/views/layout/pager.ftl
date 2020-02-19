<#macro pager url page>
    <#if page.getTotalPages() != 0>
     <ul class="uk-pagination uk-margin">
        <#if page.getNumber() != 0>
            <li><a href="${url}?page=${page.getNumber() - 1}"><span uk-pagination-previous></span></a></li>
        </#if>
        <#list 0..page.getTotalPages() - 1 as p>
            <#if p == page.getNumber()>
                <li><a href="${url}?page=${p}" tabindex="-1">${p}</a></li>
            <#else>
                <li class="uk-active"><a href="${url}?page=${p}" tabindex="-1">${p}</a></li>
            </#if>
        </#list>
        <li><a href="${url}?page=${page.getNumber() + 1}"><span uk-pagination-next></span></a></li>
        </ul>
    </#if>
</#macro>
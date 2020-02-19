<#import "layout/main.ftl" as m>

<@m.base>
    <section class="uk-section">
        <div class="uk-container">
            <article class="uk-article">
                <h1 class="uk-article-title">${contact.name} ${contact.surname}</h1>
                <p class="uk-article-meta">${contact.createdAt}</p>
                <form method="post" action="/${contact.id}/delete" name="delete-contact">
                    <button type="submit" class="uk-button uk-button-danger uk-button-small">Удалить</button>
                </form>
                <p class="uk-text-lead">
                    Номер телефона: ${contact.phone}
                </p>
                <hr>
                <#assign descr=(contact.description!"")>
                <#if descr?length &gt; 0>
                    <h3>Описание</h3>
                    <p>${contact.description}</p>
                </#if>
            </article>
        </div>
    </section>
</@m.base>
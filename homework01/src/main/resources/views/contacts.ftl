<#import "layout/main.ftl" as m>
<#import "layout/pager.ftl" as p>

<@m.base>
    <section class="uk-section">
        <div class="uk-container">
            <table class="uk-table uk-table-divider">
                <caption>Контакты</caption>
                <thead>
                <tr>
                    <th>Имя</th>
                    <th>Фамилия</th>
                    <th>Номер телефона</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <#list page.content as contact>
                    <tr>
                        <td>${contact.name}</td>
                        <td>${contact.surname}</td>
                        <td>${contact.phone}</td>
                        <td><a href="/${contact.id}">Подорбнее</a></td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <@p.pager url page></@p.pager>
        </div>
    </section>
</@m.base>
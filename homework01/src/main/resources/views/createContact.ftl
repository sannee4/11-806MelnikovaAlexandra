<#import "layout/main.ftl" as m>

<@m.base>
    <section class="uk-section">
        <div class="uk-container">
            <form name="create-contact" action="/create" method="post">
                <fieldset class="uk-fieldset">
                    <div class="uk-margin">
                        <h4>Имя</h4>
                        <input class="uk-input" type="text" placeholder="Иван" name="name">
                    </div>
                    <div class="uk-margin">
                        <h4>Фамилия</h4>
                        <input class="uk-input" type="text" placeholder="Иванов" name="surname">
                    </div>
                    <div class="uk-margin">
                        <h4>Номер телефона</h4>
                        <input class="uk-input" type="tel" placeholder="+7-999-999-99-99" pattern="+[0-9]-[0-9]{3}-[0-9]{3}-[0-9]{4}" name="phone">
                    </div>
                    <div class="uk-margin">
                        <h4>Описание</h4>
                        <textarea class="uk-textarea" type="text" placeholder="Что-то об Иване" name="description"></textarea>
                    </div>
                </fieldset>
                <input type="submit" class="uk-button"></input>
            </form>
        </div>
    </section>
</@m.base>
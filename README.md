# Автоматизированное обновление расширений 1С из Git

Предназначено для автоматизирования обновления расширений 1С.

## Порядок установки

1. Установить расширение в конфигурацию;
2. Заполнить справочник "Расширения" списком установленных в системе расширений.
3. Задать параметры обновляемых расширений;
![image](https://github.com/zerobig/Update1CExtensionsFromGit/blob/master/doc/images/screenshot_1.png)

## Как использовать

В справочнике "Расширения" выбрать в списке необходимое расширение и нажать кнопку "Обновить из Git"

## Существующие ограничения

* Версии расширений должны состоять из трех групп чисел разделённых точкой. Использование других символов не допускается
* Файл расширения конфигурации (*.cfu) должен быть прикреплён к релизу в системе контроля версий

## Планы

- [ ] Рефакторинг
- [ ] Интеграция с БСП (обновление идентификаторов метаданных, обновление регламентным заданием)
- [ ] Возможность определять способ обновления (при запуске конфигурации / регламентным заданием / вручную).
- [ ] Тесты

Тестировалось с API Github и Gitea. Если кто-то использует другие системы контроля версий, пишите - постараюсь включить в проект.
# GORA-CandidacyTask
Отображение фотографии каждого выбранного пользователя без использования библиотек для https://jsonplaceholder.typicode.com.

![First VC](https://github.com/un0dvendig/GORA-CandidacyTask/blob/master/GORA-CandidacyTask/Resources/GitHub/VC1.png) ![SecondVC](https://github.com/un0dvendig/GORA-CandidacyTask/blob/master/GORA-CandidacyTask/Resources/GitHub/VC2.png)

Для экрана фотографий:
- кэширование изображение
- отображение индикатора загрузки для каждой фотографии
- ячейки имеют тень и скруглённые углы
- отображение title под изображением (кол-во строк неограничено)

## TO-DO:
- [X] Закончить оформление README
- [ ] Вынести отдельно DataSource и Delegate всех UITableView
- [X] Пофиксить визуальные баги
- [X] Переименовать классы/файлы по необходимости 
- [X] Избавиться от всей debuginfo
- [ ] *Желательно* Добавить протоколы
- [ ] `Доп. таска` Прикрутить Core Data для offline работы

## Known issues:
- Проблема с constraints в landscape ориентации [*FastFix:* Disabled landscape orientation]
- Нехватка протоколов (жёсткая зависимость от models/view models; нехватка абстракций)
- Отсутствие модели для DataSource (возможно упрощение/уменьшение размера классов UITableViewController)

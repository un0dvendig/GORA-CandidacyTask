# GORA-CandidacyTask
Отображение фотографии каждого выбранного пользователя без использования библиотек для https://jsonplaceholder.typicode.com.

<img src="https://github.com/un0dvendig/GORA-CandidacyTask/blob/master/GORA-CandidacyTask/Resources/GitHub/VC1.png" width="400"/> <img src="https://github.com/un0dvendig/GORA-CandidacyTask/blob/master/GORA-CandidacyTask/Resources/GitHub/VC2.png" width="400"/>

Для экрана фотографий:
- кэширование изображение
- отображение индикатора загрузки для каждой фотографии
- ячейки имеют тень и скруглённые углы
- отображение title под изображением (кол-во строк неограничено)

## TO-DO:
- [X] Закончить оформление README
- [X] Вынести отдельно DataSource всех UITableView
- [ ] Вынести отдельно Delegate всех UITableView
- [X] Пофиксить визуальные баги
- [X] Переименовать классы/файлы по необходимости 
- [X] Избавиться от всей debuginfo
- [ ] *Желательно* Добавить протоколы
- [ ] `Доп. таска` Прикрутить Core Data для offline работы

## Known issues:
- Проблема с constraints в landscape ориентации [*FastFix:* Disabled landscape orientation]
- Нехватка протоколов (жёсткая зависимость от models/view models; нехватка абстракций)
- Отсутствие модели для DataSource (возможно упрощение/уменьшение размера классов UITableViewController) 
**UPD: Fixed**

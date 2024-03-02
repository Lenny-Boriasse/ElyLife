zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "ru") then
    zmlab2.language["YouDontOwnThis"] = "Тебе это не принадлежит!"
    zmlab2.language["Minutes"] = "Минуты"
    zmlab2.language["Seconds"] = "Секунды"
    zmlab2.language["CratePickupFail"] = "Ящик пуст!"
    zmlab2.language["CratePickupSuccess"] = "Собранно $MethAmount $MethName, Качество: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "У вас нет подходящей работы, чтобы взаимодействовать с этим!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Эта точка продажи не назначена вам!"
    zmlab2.language["Dropoff_assinged"] = "Продажа назначена!"
    zmlab2.language["Dropoff_cooldown"] = "Перезарядки продажи!"
    zmlab2.language["Equipment"] = "Оборудование"
    zmlab2.language["Equipment_Build"] = "Построить"
    zmlab2.language["Equipment_Move"] = "Передвинуть"
    zmlab2.language["Equipment_Repair"] = "Починить"
    zmlab2.language["Equipment_Remove"] = "Удалить"
    zmlab2.language["NotEnoughMoney"] = "У тебя не хватает денег!"
    zmlab2.language["ExtinguisherFail"] = "Объект не горит!"
    zmlab2.language["Start"] = "Начать"
    zmlab2.language["Drop"] = "Убрать"
    zmlab2.language["Move Liquid"] = "Передвинуть жидкость"
    zmlab2.language["Frezzer_NeedTray"] = "Подноса с размороженным метамфетамином не найдено!"
    zmlab2.language["ERROR"] = "ОШИБКА"
    zmlab2.language["SPACE"] = "Нажмите SPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Я не имею дела с незнакомцами! [Неправильная работа]"
    zmlab2.language["NPC_InteractionFail02"] = "У тебя нет никакого метамфетамина!"
    zmlab2.language["NPC_InteractionFail03"] = "У меня нет свободного места для продажи, вернитесь позже."
    zmlab2.language["PoliceWanted"] = "Продать метамфетамин!"
    zmlab2.language["MissingCrate"] = "Неизвестный ящик"
    zmlab2.language["Storage"] = "Полка"
    zmlab2.language["ItemLimit"] = "Вы достигли предела сущности для $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Вы уверены, что хотите убрать палатку?"
    zmlab2.language["TentFoldInfo02"] = "Любое оборудование внутри тоже будет удалено!"
    zmlab2.language["TentFoldAction"] = "РАЗОБРАТЬ"
    zmlab2.language["TentType_None"] = "НИКТО"
    zmlab2.language["TentAction_Build"] = "ПОСТАВИТЬ"
    zmlab2.language["TentBuild_Info"] = "Пожалуйста, очистите территорию!"
    zmlab2.language["TentBuild_Abort"] = "Что-то мешает!"
    zmlab2.language["Enabled"] = "Включено"
    zmlab2.language["Disabled"] = "Выключено"
    zmlab2.language["MethTypeRestricted"] = "Вам не разрешается делать этот тип метамфетамина!"
    zmlab2.language["SelectMethType"] = "Выбрать тип метамфетамина"
    zmlab2.language["SelectTentType"] = "Выберите тип палатки"
    zmlab2.language["LightColor"] = "Светлый цвет"
    zmlab2.language["Cancel"] = "Отменить"
    zmlab2.language["Deconstruct"] = "Разобрать"
    zmlab2.language["Construct"] = "Построить"
    zmlab2.language["Choosepostion"] = "Выберите новую позицию"
    zmlab2.language["ChooseMachine"] = "Выберите машину"
    zmlab2.language["Extinguish"] = "Потушить"
    zmlab2.language["PumpTo"] = "Насос, чтобы"
    zmlab2.language["ConstructionCompleted"] = "Строительство завершено!"
    zmlab2.language["Duration"] = "Продолжительность"
    zmlab2.language["Amount"] = "Количество"
    zmlab2.language["Difficulty"] = "Сложность"
    zmlab2.language["Money"] = "Деньги"
    zmlab2.language["Difficulty_Easy"] = "Легко"
    zmlab2.language["Difficulty_Medium"] = "Средне"
    zmlab2.language["Difficulty_Hard"] = "Сложно"
    zmlab2.language["Difficulty_Expert"] = "Эксперт"
    zmlab2.language["Connected"] = "Подключен!"
    zmlab2.language["Missed"] = "Промах!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Vamonos Pest Tent - Маленькая"
    zmlab2.language["tent01_desc"] = "В этой небольшой палатке предусмотрено место для 6 машин."
    zmlab2.language["tent02_title"] = "Vamonos Pest Tent - Средняя"
    zmlab2.language["tent02_desc"] = "В этой палатке среднего размера предусмотрено место для 9 машин."
    zmlab2.language["tent03_title"] = "Vamonos Pest Tent - Большая"
    zmlab2.language["tent03_desc"] = "В этой большой палатке предусмотрено место для 16 машин."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "В этой кристальной палатке есть место для 24 машин."

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Вентиляция"
    zmlab2.language["ventilation_desc"] = "Очищает окружающую территорию от загрязнений."
    zmlab2.language["storage_title"] = "Хранилище"
    zmlab2.language["storage_desc"] = "Предоставляет химикаты и оборудование."
    zmlab2.language["furnace_title"] = "Ториевая печь"
    zmlab2.language["furnace_desc"] = "Используется для нагрева кислоты."
    zmlab2.language["mixer_title"] = "Миксер"
    zmlab2.language["mixer_desc"] = "Используется как основной реакционный сосуд для объединения соединений."
    zmlab2.language["filter_title"] = "Фильтер"
    zmlab2.language["filter_desc"] = "Используется для очистки конечной смеси для повышения ее качества."
    zmlab2.language["filler_title"] = "Наполнитель"
    zmlab2.language["filler_desc"] = "Используется для заполнения конечной смеси на лотках."
    zmlab2.language["frezzer_title"] = "Морозилка"
    zmlab2.language["frezzer_desc"] = "Используется для предотвращения дальнейшей реакции конечного раствора метамфетамина."
    zmlab2.language["packingtable_title"] = "Упаковочный стол"
    zmlab2.language["packingtable_desc"] = "Обеспечивает быстрый способ разбить / упаковать метамфетамин. Может вместить до 12 лотков. Может быть обновлен с помощью автоматического ледокола."

    // Storage Config
    zmlab2.language["acid_title"] = "Плавиковая кислота"
    zmlab2.language["acid_desc"] = "Катализатор для увеличения скорости реакции."
    zmlab2.language["methylamine_title"] = "Метиламин"
    zmlab2.language["methylamine_desc"] = "Метиламин (CH3NH2) является органическим соединением и одним из основных ингредиентов для производства метамфетамина."
    zmlab2.language["aluminum_title"] = "Алюминий"
    zmlab2.language["aluminum_desc"] = "Алюминиевая амальгама используется в качестве химического реагента для восстановления соединений."
    zmlab2.language["lox_title"] = "Жидкий кислород"
    zmlab2.language["lox_desc"] = "Жидкий кислород используется во морозилке, чтобы остановить дальнейшую реакцию конечного раствора метамфетамина."
    zmlab2.language["crate_title"] = "Транспортная скорость"
    zmlab2.language["crate_desc"] = "Используется для транспортировки большого количества метамфетамина."
    zmlab2.language["palette_title"] = "Палитра"
    zmlab2.language["palette_desc"] = "Используется для транспортировки большого количества метамфетамина."
    zmlab2.language["crusher_title"] = "Ледокол"
    zmlab2.language["crusher_desc"] = "Автоматически разламывает и упаковывает метамфетамин при установке на упаковочный стол."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Метамфетамин"
    zmlab2.language["meth_desc"] = "Обычный уличный метамфетамин."
    zmlab2.language["bluemeth_title"] = "Кристально-Голубой"
    zmlab2.language["bluemeth_desc"] = "Оригинальная формула гейзенберга."
    zmlab2.language["kalaxi_title"] = "Калаксианский кристалл"
    zmlab2.language["kalaxi_desc"] = "Кристаллы Калаксиана очень похожи на многие лекарства, так как кристаллы дают вам хорошее ощущение."
    zmlab2.language["glitter_title"] = "Блеск"
    zmlab2.language["glitter_desc"] = "Блеск-это очень психоделический наркотик, недавно появившийся на улицах города. Это действительно сильная штука, даже для самых пресыщенных жителей города."
    zmlab2.language["kronole_title"] = "Кроноль"
    zmlab2.language["kronole_desc"] = "Кроноль это уличный наркотик, продаваемый на черном рынке. Препарат обладает способностью блокировать болевые рецепторы, Кроноль настолько силен, что блокирует все чувства, а не только боль."
    zmlab2.language["melange_title"] = "Меланж"
    zmlab2.language["melange_desc"] = "Меланж (Спайс) это лекарство, способное продлить жизнь, наделить повышенной жизненной силой и осознанностью, а также раскрыть предвидение у некоторых людей."
    zmlab2.language["mdma_title"] = "МДМА"
    zmlab2.language["mdma_desc"] = "МДМА впервые был разработан в 1912 году компанией Мерк. Он использовался для усиления психотерапии, начиная с 1970-х годов, и стал популярным в качестве уличного наркотика в 1980-х годах."
end
